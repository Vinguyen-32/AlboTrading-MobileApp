const express = require('express');
const { 
    getPosts, 
    getPost, 
    viewPost,
    createPost, 
    editPost,
    getNearbyPosts, 
    getPopularPosts,
    placeBid,
    offerTrade,
    getOffer
} = require('../controllers/postController');

const router = express.Router();

router.get('/users/:id/posts', getPosts);

router.get('/users/:id/posts/near_by', getNearbyPosts);

router.get('/users/:id/posts/popular', getPopularPosts);

router.get('/users/:id/posts/:postId', getPost);

router.get('/posts/:postId', viewPost);

router.post('/users/:id/posts', createPost);

router.put('/users/:id/posts/:postId', editPost);

router.post('/users/:id/bid/:postId', placeBid);

router.post('/users/:id/offer/:postId', offerTrade);

router.get('/posts/:postId/offers', getOffer);

module.exports = router;