const express = require('express');
const axios = require('axios');
require('dotenv').config({ path: __dirname + '/.env' });
const router = express.Router();

router.get('/tmdb/:endpoint', async (req, res) => {
  try {
    const url = `https://api.themoviedb.org/3/${req.params.endpoint}`;
    const response = await axios.get(url, {
      params: { ...req.query, api_key: process.env.TMDB_API_KEY }
    });
    res.json(response.data);
  } catch (err) {
    res.status(err.response?.status || 500).json({ error: err.message });
  }
});

module.exports = router;
