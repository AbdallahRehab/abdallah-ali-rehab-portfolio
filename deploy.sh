#!/bin/bash

# Build for GitHub Pages
echo "Building for GitHub Pages..."
flutter build web --release --base-href "/"

echo "Build complete. To deploy, commit the 'build/web' directory to your gh-pages branch."
echo "Example:"
echo "  cd build/web"
echo "  git init"
echo "  git add ."
echo "  git commit -m 'Deploy'"
echo "  git push -f git@github.com:username/abdallah-ali-rehab-portfolio.git master:gh-pages"
