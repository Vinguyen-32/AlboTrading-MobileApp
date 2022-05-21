'use strict';

const DB = require('../models');

const createUser = async (req, res) => {
  try {
    const {
      username,
      birthday,
      image,
      firstName,
      lastName
    } = req.body || {};

    const user = await DB.User.create({
      username,
      birthday,
      image,
      firstName,
      lastName
    })

    res.send(user);
  } catch (error) {
    res.status(400).send(error.message);
  }
}

const getUser = async (req, res) => {
  try {
    const id = req.params.id;
    const users = await DB.User.findAll({
      where: {
        id
      }
    });
    const user = users[0];

    const bidCount = await DB.Post.count({
      where: {
        type: "BIDDING"
      }
    });

    const tradeCount =  await DB.Post.count({
      where: {
        type: "TRADING"
      }
    });



    const postImages = await DB.Post.findAll({
      attributes: ["images"]
    });

    let galeryImages = [];
    postImages.map((imgs) => { 
      galeryImages.push(...imgs.images)
    })


    const result = {
      profileImage: `${user.image}`,
      name: `${user.firstName} ${user.lastName}`,
      accountName: `${user.username}`,
      followers: 190,
      following: 32,
      reviews: 23,
      stars: 5,
      trade: tradeCount,
      bid: bidCount,
      galeryImages,
      newPostImage: []
    }
console.log(result)
    res.send(result);
  } catch (error) {
    res.status(400).send(error.message);
  }
}

const editUser = async (req, res, next) => {
  try {
    const id = req.params.id;
    const users = await DB.User.findAll({
      where: {
        id
      }
    });

    const user = users[0];
    const updated = await user.update({
      ...req.body
    })

    res.send(updated);
  } catch (error) {
    res.status(400).send(error.message);
  }
}

module.exports = {
  createUser, getUser, editUser
}
