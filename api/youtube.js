const express = require('express');
const axios = require('axios');
require('dotenv').config({ path: __dirname + '/.env' });
const router = express.Router();

router.get('/youtube', async (req, res) => {
  try {
    const q = req.query.q;
    const response = await axios.get(
      'https://www.googleapis.com/youtube/v3/search',
      {
        params: {
          q,
          part: 'snippet',
          maxResults: 5,
          key: process.env.YOUTUBE_API_KEY
        }
      }
    );
    res.json(response.data);
  } catch (err) {
    res.status(err.response?.status || 500).json({ error: err.message });
  }
});

module.exports = router;
