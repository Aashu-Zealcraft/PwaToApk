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
- Git repository (recommended)

### Method 1: Automatic Build (Recommended)

The project includes a `build.sh` script that automatically installs Flutter and builds the app in Vercel's environment.

1. **Push your code to GitHub:**
   ```bash
   git add .
   git commit -m "Prepare for Vercel deployment"
   git push
   ```

2. **Connect to Vercel:**
   - Go to [Vercel Dashboard](https://vercel.com/dashboard)
   - Click "New Project"
   - Import your GitHub repository
   - Vercel will automatically detect the `vercel.json` configuration

3. **Deploy:**
   - Vercel will run the `build.sh` script automatically
   - The script installs Flutter SDK and builds your app
   - First deployment may take 5-10 minutes (Flutter installation)

### Method 2: Build Locally and Deploy

If you prefer to build locally (faster deployments):

1. **Build the Flutter web app locally:**
   ```bash
   flutter build web --release --base-href /
   ```

2. **Deploy using Vercel CLI:**
   ```bash
   npm i -g vercel
   vercel --prod
   ```
   
   Or deploy only the build folder:
   ```bash
   cd build/web
   vercel --prod
   ```

### Method 3: GitHub Actions (Advanced)

For automated CI/CD, use the included GitHub Actions workflow:

1. Add Vercel secrets to your GitHub repository:
   - `VERCEL_TOKEN`
   - `VERCEL_ORG_ID`
   - `VERCEL_PROJECT_ID`

2. Push to main/master branch to trigger automatic deployment

### Configuration

The `vercel.json` file is configured with:
- **Build command**: `bash build.sh` (installs Flutter and builds)
- **Output directory**: `build/web`
- **SPA routing**: All routes redirect to `index.html`
- **Security headers**: XSS protection, frame options, etc.

### Important Notes

- The `start_url` in `manifest.json` is set to `/` (root) for proper deployment
- Service worker is configured to work with absolute paths
- All routes are configured to serve `index.html` for SPA routing
- First deployment may take longer due to Flutter SDK installation

### Troubleshooting

**Error: "flutter: command not found"**
- ✅ Fixed! The `build.sh` script now installs Flutter automatically
- If issues persist, try Method 2 (build locally)

**404 errors after deployment:**
1. Ensure `vercel.json` is in the root directory
2. Check that the build command completes successfully
3. Verify the output directory is `build/web`
4. Make sure `start_url` in `manifest.json` is `/` not `.`

**Build timeout:**
- First build may take 5-10 minutes (Flutter installation)
- Subsequent builds are faster (Flutter is cached)
- If timeout persists, use Method 2 (build locally)

## License

© 2024 PWA to APK
