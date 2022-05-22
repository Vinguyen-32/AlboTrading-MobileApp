'use strict';

const DB = require('../models');
const multiparty = require('multiparty');
const fs = require('fs');
const path = require('path');
const moment = require('moment');
const _ = require('lodash');
const host = 'http://192.168.1.14:8080';


const createPost = async (req, res) => {
    new multiparty.Form().parse(req, async function(err, fields, files) {
        const id = req.params.id;
        const type = fields['type'][0];
        const location = fields['location'][0];
        const title = fields['title'][0];
        const caption = fields['caption'][0];
        const price = fields['price'][0];


        let filenames = [];

        (files.images || []).forEach(function(file) {
            const name = file.originalFilename.split('/').slice(-1)[0];
            fs.copyFileSync(file.path, `${path.resolve('./public/')}/${name}`);
            filenames.push(name);
        });
        
        const users = await DB.User.findAll({
            where: {
                id
            }
        });

        const post = await DB.Post.create({
            type,
            location,
            title,
            caption,
            data: {
                basePrice: Number(price),
                currency: "USD",
                minimumBid: 10
            },
            images: filenames.map((item) => { return `${host}/${item}`}),
            time: new Date(),
            isActive: true,
            UserId: users[0].id
        })

        res.send(post);
    });
}

const viewPost = async (req, res) => {
    try {
        const { postId } = req.params || {};
        const posts = await DB.Post.findAll({
            where: {
                id: postId,
            },
            include: [{
                model: DB.User
            }]
        });
        
        let post = JSON.parse(JSON.stringify(posts[0]));
        
        let highestBid;
        if (post.type == 'BIDDING'){
            highestBid = await DB.Bid.findAll({
                limit: 1,
                where: {
                    PostId: postId,
                },
                order: [
                    ['amount', 'DESC'],
                ]
            });
        }
        post.author = post.User.firstName + " " + post.User.lastName;
        post.avatar = post.User.image;
        post.price = `${_.get(highestBid, "[0]amount") || _.get(post, "data.basePrice")}`;
        post.endAt = moment().add("day", 7);
        delete post.User;
        delete post.data;

        res.send(post);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const getPost = async (req, res) => {
    try {
        const { id, postId } = req.params || {};
        const posts = await DB.Post.findAll({
            where: {
                id: postId,
                UserId: id
            },
        });

        res.send(posts[0]);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const getPosts = async (req, res) => {
    try {
        const { id, postId } = req.params || {};
        let posts = await DB.Post.findAll({
            where: {
                UserId: id
            }
        });

        const user = await DB.User.findAll({
            where: {
                id
            }
        })

        posts = posts.map((post, idx) => {
            post = JSON.parse(JSON.stringify(post));
            post.name = `${user[0].firstName} ${user[0].lastName}`;
            return post;
        })
        console.log("possss: " + JSON.stringify(posts, null, 4))
        res.send(posts);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const getFeeds = async (req, res) => {
    try {
        const { id, postId } = req.params || {};
        let posts = await DB.Post.findAll({
            include: [{
                model: DB.User
            }],
            order: [
                ['id', 'DESC'],
            ]
        });

        const user = await DB.User.findAll({
            where: {
                id
            }
        })

        posts = posts.map((post) => {
            post = JSON.parse(JSON.stringify(post));
            post.name = `${post.User.firstName} ${post.User.lastName}`;
            post.avatar = post.User.image;
            return post;
        })
        res.send(posts);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const editPost = async (req, res, next) => {
    try {
        const { id, postId } = req.params || {};
        const posts = await DB.Post.findAll({
            where: {
                id: postId,
                UserId: id
            }
        });

        const post = posts[0];
        const updated = await post.update({
            ...req.body
        })

        res.send(updated);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const getNearbyPosts = async (req, res) => {
    try {
        const { id, postId } = req.params || {};
        const posts = await DB.Post.findAll({
            include: [{
                model: DB.User
            }]
        });

        const result = posts.map((item) => {
            return {
                id: item.id,
                title: item.title,
                plantName: item.caption,
                author: `${item.User.firstName} ${item.User.lastName}`,
                image: item.images[0],
                time: item.time,
                price: _.get(item, "data.basePrice") || 0,
                type: item.type,
                isLocal: true,
            }
        })
        res.send(result);
    } catch (error) {
        console.log(error);
        res.status(400).send(error.message);
    }
}

const getPopularPosts = async (req, res) => {
    try {
        const { id, postId } = req.params || {};
        const posts = await DB.Post.findAll({
            // where: {
            //     UserId: id
            // }
        });

        res.send(posts);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const placeBid = async (req, res) => {
    try {
        const { id, postId } = req.params || {};
        const amount = req.body.amount;
        
        const posts = await DB.Post.findAll({
            where: {
                id: postId
            }
        });

        const users = await DB.User.findAll({
            where: {
                id: id
            }
        })

        const post = posts[0];
        const user = users[0];


        const bid = await DB.Bid.create({
            PostId: parseInt(postId),
            UserId: parseInt(id),
            amount: parseFloat(amount)
        })


        res.send(posts);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const offerTrade = async (req, res) => {
    new multiparty.Form().parse(req, async function(err, fields, files) {
        const title = fields['title'][0];

        const { id, postId } = req.params || {};
        
        const posts = await DB.Post.findAll({
            where: {
                id: postId
            }
        });

        const users = await DB.User.findAll({
            where: {
                id: id
            }
        })

        const post = posts[0];
        const user = users[0];


        let filenames = [];

        (files.images || []).forEach(function(file) {
            const name = file.originalFilename.split('/').slice(-1)[0];
            fs.copyFileSync(file.path, `${path.resolve('./public/')}/${name}`);
            filenames.push(name);
        });
        
        const offer = await DB.Offer.create({
            images: filenames.map((item) => { return `${host}/${item}`}),
            title,
            PostId: post.id,
            UserId: user.id
        })

        res.send(offer);
    });
}

const getOffer = async (req, res) => {
    try {
        const { postId } = req.params || {};
        const posts = await DB.Post.findAll({
            where: {
                id: postId
            }
        });

        const offers = await DB.Offer.findAll({
            where: {
                PostId: posts[0].id
            },
            include: [{
                model: DB.User
            }]
        })

        let result = JSON.parse(JSON.stringify(offers));
        result.map((item, i) => {
            result[i].name = `${item.User.firstName} ${item.User.lastName}`;
            delete result[i].User;
        })
        
        res.send(result);
    } catch (error) {

        console.log(error)
        res.status(400).send(error.message);
    }
}

module.exports = {
    createPost,
    getPost,
    getPosts,
    viewPost,
    editPost,
    getNearbyPosts,
    getPopularPosts,
    placeBid,
    offerTrade,
    getOffer,
    getFeeds,
}
