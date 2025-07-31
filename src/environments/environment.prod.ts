export const environment = {
  production: true,
  TMDB_API_KEY: '',                // Leave blank, use backend proxy in production!
  YOUTUBE_API_KEY: '',             // Leave blank, use backend proxy in production!
  OPENAI_API_PROXY: '/api/openai-proxy',   // Always use backend proxy
  YOUTUBE_API_PROXY: '/api/youtube-proxy', // (Optional)
  TMDB_API_PROXY: '/api/tmdb-proxy',       // (Optional)
};
