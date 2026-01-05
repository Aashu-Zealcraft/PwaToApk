#!/bin/bash
set -e

echo "Starting Flutter build process..."

# Install Flutter SDK using the official installation method
FLUTTER_VERSION="stable"
FLUTTER_SDK_PATH="$HOME/flutter"

# Check if Flutter is already installed (for caching)
if [ ! -d "$FLUTTER_SDK_PATH" ]; then
  echo "Downloading Flutter SDK..."
  git clone --depth 1 --branch $FLUTTER_VERSION https://github.com/flutter/flutter.git $FLUTTER_SDK_PATH
else
  echo "Flutter SDK found, updating..."
  cd $FLUTTER_SDK_PATH
  git fetch --depth 1 origin $FLUTTER_VERSION
  git checkout $FLUTTER_VERSION
  cd -
fi

# Add Flutter to PATH
export PATH="$FLUTTER_SDK_PATH/bin:$PATH"

# Precache Flutter web dependencies (faster than full doctor)
echo "Precaching Flutter web dependencies..."
flutter precache --web

# Get project dependencies
echo "Getting project dependencies..."
flutter pub get

# Build web app
echo "Building Flutter web app for production..."
flutter build web --release --base-href / --web-renderer canvaskit

echo "✅ Build completed successfully!"

