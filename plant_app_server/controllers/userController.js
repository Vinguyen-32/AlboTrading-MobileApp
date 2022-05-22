'use strict';

const DB = require('../models');
const multiparty = require('multiparty');
const fs = require('fs');
const path = require('path');
const host = 'http://192.168.1.14:8080';

const createUser = async (req, res) => {
  try {
    const {
      username,
      password,
      image,
      firstName,
      lastName
    } = req.body || {};

    const user = await DB.User.create({
      username,
      password,
      image,
      firstName,
      lastName,
      ratingstar: 0
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
        UserId: user.id,
        type: "BIDDING"
      }
    });

    const tradeCount = await DB.Post.count({
      where: {
        UserId: user.id,
        type: "TRADING"
      }
    });



    const postImages = await DB.Post.findAll({
      where: {
        UserId: user.id
      },
      attributes: ["images"]
    });

    let galeryImages = [];
    postImages.map((imgs) => {
      galeryImages.push(...imgs.images)
    })


    const result = {
      id: user.id,
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

const login = async (req, res, next) => {
  try {
    const { username, password } = req.body;
    const users = await DB.User.findAll({
      where: {
        username,
        password
      }
    });

    const user = users[0];
    if (user){
      let result = JSON.parse(JSON.stringify(user));
      result.profileImage = result.image;
      console.log(JSON.stringify(result, null, 4));
      res.send(result);
    }
    else {
      res.send({});
    }
  } catch (error) {
    res.status(400).send(error.message);
  }
}

const signup = async (req, res, next) => {
  try {
    const { username, password, firstName, lastName } = req.body;
    const users = await DB.User.findAll({
      where: {
        username,
      }
    });

    const user = users[0];
    console.log(JSON.stringify(user, null, 4))
    // There is already an user with given username
    if (user){
      res.send({});
    }
    else {
      const newUser = await DB.User.create({
        username, 
        password, 
        firstName, 
        lastName
      })

      res.send(newUser || {});
    }
  } catch (error) {
    res.status(400).send(error.message);
  }
}

const uploadAvatar = async (req, res) => {
  new multiparty.Form().parse(req, async function(err, fields, files) {
      const id = req.params.id;
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

      const newUser = await users[0].update({
        image: filenames.map((item) => { return `${host}/${item}`})[0]
      })

      res.send(newUser);
  });
}

module.exports = {
  createUser, getUser, editUser, login, signup, uploadAvatar
}
