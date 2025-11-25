#!/bin/bash

# Drop Prototype - Setup Script
# Automates environment setup and code generation

set -e  # Exit on error

echo "🚀 Drop Prototype Setup"
echo "======================="
echo ""

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter is not installed. Please install Flutter first:"
    echo "   https://docs.flutter.dev/get-started/install"
    exit 1
fi

echo "✅ Flutter detected: $(flutter --version | head -n 1)"
echo ""

# Check Flutter doctor
echo "🔍 Running Flutter doctor..."
flutter doctor
echo ""

# Get dependencies
echo "📦 Getting Flutter dependencies..."
flutter pub get
echo ""

# Run code generation
echo "⚙️  Running code generation (Freezed, JSON Serializable, Riverpod)..."
dart run build_runner build --delete-conflicting-outputs
echo ""

# Run tests
echo "🧪 Running tests..."
flutter test
echo ""

# Run static analysis
echo "🔍 Running static analysis..."
flutter analyze
echo ""

echo "✅ Setup complete!"
echo ""
echo "📱 To run the app:"
echo "   flutter run"
echo ""
echo "🧪 To run tests:"
echo "   flutter test"
echo ""
echo "📝 To run code generation again:"
echo "   dart run build_runner build --delete-conflicting-outputs"
echo ""
echo "Happy coding! 🎉"
