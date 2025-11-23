# Abdallah Ali Rehab Portfolio

A futuristic, space-themed personal portfolio website built with Flutter Web, designed to showcase the work and experience of a Senior Mobile Developer.

## 🌟 Live Demo

[View Portfolio](https://AbdallahRehab.github.io/)

## ✨ Features

### 🌌 Core Experience

- **Space Theme**: Immersive animated starfield background with parallax effects, neon glows, and glassmorphism UI.
- **Fully Responsive**: Adaptive layout that works seamlessly on Mobile, Tablet, and Desktop.
- **Interactive Elements**: Hover effects, scroll animations, and dynamic transitions.
- **High Performance**: Optimized assets, lazy loading, and smooth 60fps animations.

### 🚀 Sections

1. **Hero Section**:
   - Animated entrance with floating rocket.
   - Quick access to CV download and contact.
2. **About Me**:
   - Professional bio and key achievement statistics.
3. **Tech Stack**:
   - Animated floating icons representing skills (Flutter, Dart, Firebase, etc.).
4. **Projects**:
   - Interactive grid of project cards.
   - Detailed modal views with project descriptions, tech tags, and store links.
5. **Experience Timeline**:
   - Vertical visual timeline of career milestones.
6. **Certificates**:
   - Glowing badge-style cards for professional certifications.
7. **Contact**:
   - Futuristic contact form with validation.
   - Direct social media links (LinkedIn, GitHub, WhatsApp).

## 🛠️ Tech Stack

- **Framework**: [Flutter Web](https://flutter.dev/multi-platform/web) (Stable Channel)
- **State Management**: [Flutter Bloc](https://pub.dev/packages/flutter_bloc)
- **Animations**: [Flutter Animate](https://pub.dev/packages/flutter_animate)
- **Styling**: Custom Theme System & Glassmorphism
- **Icons**: FontAwesome & Material Icons
- **Typography**: Google Fonts (Outfit/Inter)

## 📂 Project Structure

```
lib/
├── config/             # App configuration
├── core/
│   ├── theme/          # AppTheme, Colors, Typography
│   └── widgets/        # Reusable widgets (GlassButton, SocialIcon, etc.)
├── features/
│   ├── home/           # Hero section, Starfield background
│   ├── about/          # Bio, Timeline, Certificates
│   ├── projects/       # Project grid and details modal
│   └── contact/        # Contact form
├── data/               # Data models and repositories
└── main.dart           # Entry point
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (Latest Stable)
- Dart SDK

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/AbdallahRehab/AbdallahRehab.github.io.git
   cd AbdallahRehab.github.io
   ```

2. **Install Dependencies**

   ```bash
   flutter pub get
   ```

3. **Run Locally**
   ```bash
   flutter run -d chrome
   ```

## 📦 Deployment

### GitHub Pages (Automated)

This project is configured with GitHub Actions for automatic deployment.
Any push to the `main` branch will trigger a build and deploy to the `gh-pages` branch.

**Manual Build:**

```bash
flutter build web --release --base-href "/"
```

### Vercel

1. Install Vercel CLI: `npm i -g vercel`
2. Run `vercel deploy`
3. Build Command: `flutter build web --release`
4. Output Directory: `build/web`

## ⚙️ Customization

You can easily update the portfolio content without touching the code by editing `assets/config.json`.

- **Personal Info**: Name, Role, Bio
- **Projects**: Add/Remove projects, update links
- **Socials**: Update social media URLs

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Built with 💙 and Flutter by [Abdallah Ali Rehab](https://github.com/AbdallahRehab)
