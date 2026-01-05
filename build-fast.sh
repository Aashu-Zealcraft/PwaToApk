#!/bin/bash
set -e

echo "Starting optimized Flutter build..."

# Use Flutter SDK archive (faster than git clone)
FLUTTER_VERSION="3.24.0"  # Update to latest stable version
FLUTTER_SDK_PATH="$HOME/flutter"

if [ ! -d "$FLUTTER_SDK_PATH" ]; then
  echo "Downloading Flutter SDK archive..."
  cd $HOME
  wget -q https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz || \
  curl -L https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz -o flutter.tar.xz
  
  tar xf flutter.tar.xz || tar xf flutter.tar.xz
  rm -f flutter.tar.xz
fi

# Add Flutter to PATH
export PATH="$FLUTTER_SDK_PATH/bin:$PATH"

# Precache web dependencies
echo "Setting up Flutter..."
flutter precache --web

# Get dependencies
echo "Getting dependencies..."
flutter pub get

# Build
echo "Building web app..."
flutter build web --release --base-href / --web-renderer canvaskit

echo "✅ Build complete!"

