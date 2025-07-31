#!/bin/bash

# Ensure script runs from the project root
mkdir -p api

# Create .env file if missing
if [ ! -f api/.env ]; then
cat <<EOL > api/.env
OPENAI_API_KEY=your_openai_key_here
TMDB_API_KEY=your_tmdb_key_here
YOUTUBE_API_KEY=your_youtube_key_here
EOL
echo "Created api/.env (REMEMBER: Replace with your real keys!)"
else
    echo "api/.env already exists"
fi

# openai.js
cat <<EOL > api/openai.js
const express = require('express');
const axios = require('axios');
require('dotenv').config({ path: __dirname + '/.env' });
const router = express.Router();

router.post('/openai', async (req, res) => {
  try {
    const response = await axios.post(
      'https://api.openai.com/v1/chat/completions',
      req.body,
      {
        headers: {
          'Authorization': \`Bearer \${process.env.OPENAI_API_KEY}\`,
          'Content-Type': 'application/json'
        }
      }
    );
    res.json(response.data);
  } catch (err) {
    res.status(err.response?.status || 500).json({ error: err.message });
  }
});

module.exports = router;
EOL

# tmdb.js
cat <<EOL > api/tmdb.js
const express = require('express');
const axios = require('axios');
require('dotenv').config({ path: __dirname + '/.env' });
const router = express.Router();

router.get('/tmdb/:endpoint', async (req, res) => {
  try {
    const url = \`https://api.themoviedb.org/3/\${req.params.endpoint}\`;
    const response = await axios.get(url, {
      params: { ...req.query, api_key: process.env.TMDB_API_KEY }
    });
    res.json(response.data);
  } catch (err) {
    res.status(err.response?.status || 500).json({ error: err.message });
  }
});

module.exports = router;
EOL

# youtube.js
cat <<EOL > api/youtube.js
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
EOL

# index.js
cat <<EOL > api/index.js
const express = require('express');
const openai = require('./openai');
const tmdb = require('./tmdb');
const youtube = require('./youtube');
const app = express();
app.use(express.json());

app.use('/api', openai);
app.use('/api', tmdb);
app.use('/api', youtube);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(\`API server listening on port \${PORT}\`));
EOL

echo "API folder and files created!"

# Add dependencies to package.json (if not present)
if ! grep -q '"express"' package.json; then
    npm install express axios dotenv
fi
