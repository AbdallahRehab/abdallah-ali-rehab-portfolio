# Abdallah Ali Rehab Portfolio

A futuristic, space-themed personal portfolio website built with Flutter Web.

## Features

- 🌌 **Space Theme**: Animated starfield background, neon glows, and glassmorphism.
- 📱 **Fully Responsive**: Optimized for mobile, tablet, and desktop.
- 🚀 **Interactive**: Hover effects, scroll animations, and project details modal.
- ⚡ **Performance**: Lazy loading, optimized assets, and smooth transitions.

## Tech Stack

- **Framework**: Flutter Web
- **State Management**: Flutter Bloc
- **Animations**: Flutter Animate
- **Styling**: Custom Theme & Glassmorphism

## Getting Started

1. **Install Dependencies**

   ```bash
   flutter pub get
   ```

2. **Run Locally**

   ```bash
   flutter run -d chrome
   ```

3. **Build for Production**
   ```bash
   flutter build web --release --web-renderer canvaskit
   ```

## Deployment

### Vercel (Recommended)

1. Install Vercel CLI: `npm i -g vercel`
2. Run `vercel deploy` in the project root.
3. Set the build command to `flutter build web --release` and output directory to `build/web`.

### GitHub Pages

1. Build the project:
   ```bash
   flutter build web --release --base-href "/abdallah-ali-rehab-portfolio/"
   ```
2. Deploy the `build/web` folder to the `gh-pages` branch.

## Customization

Edit `assets/config.json` to update personal information, projects, and links without changing the code.

## License

MIT
