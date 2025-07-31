export const environment = {
  production: false,
  // ⚠️ DO NOT commit real API keys to your public repo!
  // For dev/test, it's okay, but in production use .env and backend proxies.

  // Public key (okay in browser)
  TMDB_API_KEY: '256641bf1f82e746eeec12ed659af733',         // <-- YOUR TMDB KEY

  // If you must use YouTube API from frontend (not recommended), use public key
  YOUTUBE_API_KEY: 'AIzaSyAv3U8hm6Zp88Yt-g-Ov4YCpR6F32aHwBU', // <-- YOUR YOUTUBE KEY

  // Never expose secret keys (OpenAI etc) in browser code!
  // Use these only as placeholders, and route all calls through your backend.
  OPENAI_API_PROXY: '/api/openai-proxy',  // Frontend sends requests here, backend uses secret key

  // Example for possible future API endpoints/proxies
  YOUTUBE_API_PROXY: '/api/youtube-proxy', // (Optional)
  TMDB_API_PROXY: '/api/tmdb-proxy',       // (Optional)
};
