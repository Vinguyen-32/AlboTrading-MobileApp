'use strict';

const DB = require('../models');

const createPost = async (req, res) => {
    try {
        const id = req.params.id;
        const {
            type,
            location,
            title,
            caption,
            images
        } = req.body || {};

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
            images,
            time: new Date(),
            isActive: true,
            UserId: users[0].id
        })

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
            }
        });

        res.send(posts[0]);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const getPosts = async (req, res) => {
    try {
        const { id, postId } = req.params || {};
        const posts = await DB.Post.findAll({
            where: {
                UserId: id
            }
        });

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
            where: {
                UserId: id
            }
        });

        res.send(posts);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const getPopularPosts = async (req, res) => {
    try {
        const { id, postId } = req.params || {};
        const posts = await DB.Post.findAll({
            where: {
                UserId: id
            }
        });

        res.send(posts);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

module.exports = {
    createPost,
    getPost,
    getPosts,
    editPost,
    getNearbyPosts,
    getPopularPosts
}
