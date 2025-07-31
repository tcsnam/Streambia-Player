const express = require('express');
const openai = require('./openai');
const tmdb = require('./tmdb');
const youtube = require('./youtube');
const app = express();
app.use(express.json());

app.use('/api', openai);
app.use('/api', tmdb);
app.use('/api', youtube);

// Add this block
app.get('/', (req, res) => {
  res.send('Streambia API is running! 🚀');
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`API server listening on port ${PORT}`));
