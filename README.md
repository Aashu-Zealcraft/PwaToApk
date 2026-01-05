# PWA to APK

A Flutter application that converts Progressive Web Apps (PWAs) into native Android applications. This app provides a web view interface to browse and interact with web content in a native app experience.

## Features

- 🌐 **Web View Browser**: Full-featured web browser with URL navigation
- ⚙️ **Settings Page**: Customizable app preferences
- 📱 **PWA Support**: Configured as a Progressive Web App
- 🎨 **Modern UI**: Beautiful, responsive Material Design interface
- 🔄 **Multiple Pages**: Home, Web View, Settings, and About pages

## Project Structure

```
lib/
├── main.dart              # Main app entry point with routing
└── pages/
    ├── home_page.dart    # Home page with navigation cards
    ├── webview_page.dart # Web browser page
    ├── settings_page.dart # Settings and preferences
    └── about_page.dart   # About page with app information
```

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- Chrome browser (for web development)

### Installation

1. Clone or navigate to this project directory
2. Install dependencies:
   ```bash
   flutter pub get
   ```

### Running the App

#### Web (PWA)
```bash
flutter run -d chrome
```

#### Android
```bash
flutter run -d android
```

#### iOS
```bash
flutter run -d ios
```

## PWA Configuration

The app is configured as a Progressive Web App with:
- `manifest.json` - PWA manifest file
- `service_worker.js` - Service worker for offline support
- Proper meta tags in `index.html`

## Dependencies

- `webview_flutter: ^4.9.0` - Web view functionality
- `flutter` - Flutter SDK
- `cupertino_icons: ^1.0.8` - iOS-style icons

## Pages

1. **Home Page**: Main landing page with navigation cards to different sections
2. **Web View Page**: Full-featured web browser with URL bar and navigation controls
3. **Settings Page**: App preferences including notifications, dark mode, and language settings
4. **About Page**: App information, features, and version details

## Development

This project uses:
- Material Design 3
- Flutter routing for navigation
- WebView for displaying web content
- PWA best practices for web deployment

## Deployment to Vercel

### Prerequisites
- Vercel account
- Flutter SDK installed
- Git repository (optional, but recommended)

### Steps

1. **Build the Flutter web app:**
   ```bash
   flutter build web --release --base-href /
   ```

2. **Deploy to Vercel:**
   
   **Option A: Using Vercel CLI**
   ```bash
   npm i -g vercel
   vercel
   ```
   
   **Option B: Using GitHub Integration**
   - Push your code to GitHub
   - Connect your repository to Vercel
   - Vercel will automatically detect the `vercel.json` configuration

3. **Configuration:**
   - The `vercel.json` file is already configured with:
     - Build command: `flutter build web --release --base-href /`
     - Output directory: `build/web`
     - SPA routing: All routes redirect to `index.html`
     - Proper headers for PWA support

### Important Notes

- The `start_url` in `manifest.json` is set to `/` (root) for proper deployment
- Service worker is configured to work with absolute paths
- All routes are configured to serve `index.html` for SPA routing
- The build output directory is `build/web`

### Troubleshooting

If you encounter 404 errors:
1. Ensure `vercel.json` is in the root directory
2. Check that the build command completes successfully
3. Verify the output directory is `build/web`
4. Make sure `start_url` in `manifest.json` is `/` not `.`

## License

© 2024 PWA to APK
