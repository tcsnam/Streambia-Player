#!/bin/bash

mkdir -p src/app

# Create src/main.ts if missing
if [ ! -f src/main.ts ]; then
cat > src/main.ts <<EOL
import { bootstrapApplication } from '@angular/platform-browser';
import { AppComponent } from './app/app.component';
import { appConfig } from './app/app.config';

bootstrapApplication(AppComponent, appConfig)
  .catch(err => console.error(err));
EOL
echo "✅ Created src/main.ts"
fi

# Create src/polyfills.ts if missing
if [ ! -f src/polyfills.ts ]; then
echo "// Angular CLI polyfills file (empty for now)" > src/polyfills.ts
echo "✅ Created src/polyfills.ts"
fi

# Create src/styles.scss if missing
if [ ! -f src/styles.scss ]; then
cat > src/styles.scss <<EOL
body {
  margin: 0;
  font-family: 'Segoe UI', Arial, sans-serif;
  background: #181e22;
  color: #fff;
}
EOL
echo "✅ Created src/styles.scss"
fi

# Create src/index.html if missing
if [ ! -f src/index.html ]; then
cat > src/index.html <<EOL
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>Streambia Player</title>
  <base href="/" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<body>
  <app-root></app-root>
</body>
</html>
EOL
echo "✅ Created src/index.html"
fi

# Create src/app/app.component.ts if missing
if [ ! -f src/app/app.component.ts ]; then
cat > src/app/app.component.ts <<EOL
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  template: \`
    <h1>Welcome to Streambia Player!</h1>
    <p>Your Angular app is running.</p>
  \`,
  styles: [\`
    h1 { color: #ff6f00; }
    p { color: #00b8d4; }
  \`]
})
export class AppComponent {}
EOL
echo "✅ Created src/app/app.component.ts"
fi

# Create src/app/app.config.ts if missing
if [ ! -f src/app/app.config.ts ]; then
cat > src/app/app.config.ts <<EOL
import { ApplicationConfig } from '@angular/core';
import { provideRouter } from '@angular/router';

export const appConfig: ApplicationConfig = {
  providers: [provideRouter([])],
};
EOL
echo "✅ Created src/app/app.config.ts"
fi

echo "🎉 All critical Angular files checked/created!"
