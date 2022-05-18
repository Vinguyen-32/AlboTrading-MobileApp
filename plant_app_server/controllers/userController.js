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


    const mock = {
      profileImage: "assets/images/img1.jpg",
      name: "Vi Nguyen",
      accountName: "samvi32",
      followers: 190,
      following: 32,
      reviews: 23,
      stars: 5,
      trade: 6,
      bid: 4,
      galeryImages: [
        "assets/images/img.png",
        "assets/images/img1.jpg",
        "assets/images/img2.png",
        "assets/images/img3.png",
        "assets/images/img4.png",
      ],
      newPostImage: []
    }

    res.send(mock);
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
