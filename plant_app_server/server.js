const express = require('express');
const app = express()
const port = 3000

const bodyParser = require('body-parser').json();

app.get('/home', (req, res) => {
    let result = {
        total: 12,
        posts: [{
            author: {
                name: "Vi Nguyen",

            }

        }]
    }
  res.send('Hello World!')
})

app.get('/users/:username', (req, res) => {
    let result = {
      id: 1,
      username: "vinguyen32",
      firstName: "Vi",
      lastName: "Nguyen",
      followers: 123,
      following: 32,
      trades: 21,
      bids: 15,
      ratingstar: 4.5,
      posts:
      [
        {
          id: 72,
          type: "BIDDING",
          title: "this is a bidding post",
          image: "<some url>"
        },
        {
          id: 73,
          type: "TRADING",
          title: "this is a trading post",
          image: "<some url>"
        }
      ],
    }
  res.send(result);
})

app.put('/users/:username', bodyParser, (req, res) => {
  console.log(req.body);
  res.send(req.body);
})

app.get('/trading/:id', (req, res) => {
  let result = {
    id: 1,
    username: "",
    firstName: "",
    lastName: "",
    title: "",
    images: [
      "url",
      "url",
    ],
    pickupAdress: "",
    tradedPlants: [
      {
        id: 1,
        username:"plantworld",
        firstName: "Sam",
        lastName: "Nguyen",
        userId: "2",
        title: "Monstera Albo",
        images: [
          "url",
          "url",
          "url",
        ],
      },
      {
        id: 1,
        username:"catandplants",
        firstName: "Sam",
        lastName: "Nguyen",
        userId: "3",
        title: "Monstera Albo",
        images: [
          "url",
          "url",
          "url",
        ],
      }
    ],
  }
  res.send(result);
})

app.post('/trading/:id', bodyParser, (req, res) => {
  let request = {
    id: 1,
    username: "",
    firstName: "",
    lastName: "",
    title: "",
    images: [
      "url",
    ],
  }
  res.send(request);
})

app.get('/bidding/:id', (req, res) => {
  let result = {
    id: 1,
    username: "",
    firstName: "",
    lastName: "",
    title: "",
    images: [
      "url",
      "url",
    ],
    biddingEnds:"",
    biddingPrice: 123,
    currentPrice: 321,
    pickupStatus: "Available",
    shipping:"",
  }
  res.send(result);
})

app.post('/bidding/:id', bodyParser, (req, res) => {
  let request = {
    id: 1,
    username: "",
    firstName: "",
    lastName: "",
    title: "",
    bidAmount: 123 ,
  }
  res.send(request);
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
