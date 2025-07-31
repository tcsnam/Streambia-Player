#!/bin/bash

# Create config and environment folders if they don't exist
mkdir -p src/environments
mkdir -p src/assets
touch src/environments/environment.ts
touch src/environments/environment.prod.ts
touch .env             # For backend/server use
touch src/assets/.keep # Keeps asset folder in git

# Add example content for Angular environment files
cat <<EOT > src/environments/environment.ts
export const environment = {
  production: false,
  TMDB_API_KEY: '',      // Set by Codex
  YOUTUBE_API_KEY: '',   // Set by Codex
  OPENAI_API_KEY: '',    // Set by Codex (frontend NEVER uses the real key)
};
EOT

cat <<EOT > src/environments/environment.prod.ts
export const environment = {
  production: true,
  TMDB_API_KEY: '',      // Set by Codex
  YOUTUBE_API_KEY: '',   // Set by Codex
  OPENAI_API_KEY: '',    // Set by Codex (frontend NEVER uses the real key)
};
EOT

# Add .env example for backend (Node/Express or similar)
cat <<EOT > .env
TMDB_API_KEY=
YOUTUBE_API_KEY=
OPENAI_API_KEY=
EOT

echo "Environment and config files created. Please fill in your API keys as needed!"
