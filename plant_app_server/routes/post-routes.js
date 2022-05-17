const express = require('express');
const { 
    getPosts, 
    getPost, 
    createPost, 
    editPost,
    getNearbyPosts, 
    getPopularPosts 
} = require('../controllers/postController');

const router = express.Router();

router.get('/users/:id/posts', getPosts);

router.get('/users/:id/posts/near_by', getNearbyPosts);

router.get('/users/:id/posts/popular', getPopularPosts);

router.get('/users/:id/posts/:postId', getPost);

router.post('/users/:id/posts', createPost);

router.put('/users/:id/posts/:postId', editPost);

module.exports = router;