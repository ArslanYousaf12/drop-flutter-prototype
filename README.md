# Drop Prototype - Flutter Product Feed Application

A production-ready Flutter mobile application demonstrating Clean Architecture principles, modern state management, and professional development practices.

![Flutter](https://img.shields.io/badge/Flutter-3.7.0+-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)
![License](https://img.shields.io/badge/license-MIT-green)

## 🎥 Live Demo

**Want to see it in action first?** Watch the app running on iOS Simulator:

### 📱 [**Watch Demo Video →**](https://go.screenpal.com/watch/cTXT2mnqvXS)

> **Quick Preview:** See the product feed, detail screens, Hero animations, pull-to-refresh, and loading states in action. No installation required—just watch!

---

## 📱 Overview

**Drop Prototype** is a skills assessment project showcasing how to build scalable, maintainable Flutter applications using industry best practices. While the app features just two screens (product feed and product detail), the architecture is designed to support enterprise-scale applications with dozens of features.

### Key Features

- ✅ **Product Feed**: Grid layout with 15 products across 4 categories
- ✅ **Product Detail**: Expandable image header with detailed information
- ✅ **Hero Animations**: Smooth transitions between screens
- ✅ **Pull-to-Refresh**: Intuitive content refresh
- ✅ **Shimmer Loading**: Professional loading states
- ✅ **Error Handling**: Comprehensive error states with retry
- ✅ **Haptic Feedback**: Enhanced user interaction
- ✅ **Material 3 Design**: Modern, clean UI

## 🏗️ Architecture

This project implements **Clean Architecture** with a feature-first folder structure:

```
lib/
├── core/                          # Shared app infrastructure
│   ├── constants/                 # App-wide constants
│   ├── theme/                     # Material 3 theme, colors, typography
│   └── router/                    # GoRouter configuration
│
├── features/                      # Feature modules
│   └── products/
│       ├── data/                  # Data Layer
│       │   ├── models/            # Freezed data models
│       │   ├── datasources/       # Mock Supabase datasource
│       │   └── repositories/      # Repository implementations
│       │
│       ├── domain/                # Domain Layer (Business Logic)
│       │   ├── entities/          # Pure business objects
│       │   └── repositories/      # Repository interfaces
│       │
│       └── presentation/          # Presentation Layer (UI)
│           ├── providers/         # Riverpod state management
│           ├── screens/           # Screen widgets
│           └── widgets/           # Reusable components
│
└── main.dart                      # App entry point
```

### Architecture Layers

#### 1. **Domain Layer** (Business Logic)
- Pure Dart code, no Flutter dependencies
- Defines business entities (`ProductEntity`)
- Defines repository interfaces
- Independent of data sources and UI

#### 2. **Data Layer** (Data Management)
- Implements repository interfaces
- Handles data transformation (Model ↔ Entity)
- Manages data sources (Mock Supabase)
- Uses Freezed for immutable models

#### 3. **Presentation Layer** (UI)
- Riverpod for state management
- Screens and reusable widgets
- Handles user interaction and navigation
- Material 3 design components

### Why Clean Architecture?

- **Testability**: Each layer can be tested independently
- **Maintainability**: Clear separation of concerns
- **Scalability**: Easy to add features without affecting existing code
- **Flexibility**: Swap implementations (e.g., Mock → Real Supabase) without changing business logic

## 🛠️ Tech Stack

| Category | Technology | Purpose |
|----------|-----------|---------|
| **Framework** | Flutter 3.7.0+ | Cross-platform mobile development |
| **Language** | Dart 3.0+ | Type-safe programming |
| **State Management** | Riverpod 2.4.0+ | Reactive state management with code generation |
| **Navigation** | GoRouter 13.0.0+ | Type-safe declarative routing |
| **Data Models** | Freezed 2.4.0+ | Immutable data classes |
| **Serialization** | JSON Serializable | Type-safe JSON parsing |
| **Backend Structure** | Supabase-ready | Mock data structured for easy Supabase migration |
| **Image Loading** | Cached Network Image | Efficient image caching |
| **Loading States** | Shimmer | Professional loading animations |
| **UI Design** | Material 3 | Modern design system |

## 🚀 Quick Start

> **👀 Just want to see what the app looks like?** [Watch the demo video](https://go.screenpal.com/watch/cTXT2mnqvXS) first!

### Prerequisites

#### For Complete Beginners

**New to Flutter?** Follow these video tutorials to install Flutter on your system:

| Platform | Video Tutorial | Duration |
|----------|---------------|----------|
| 🪟 **Windows** | [Flutter Installation Guide for Windows](https://www.youtube.com/watch?v=2svrbgcHZew) | ~15 mins |
| 🍎 **macOS** | [Flutter Installation Guide for Mac](https://www.youtube.com/watch?v=343PpFsTDvM) | ~15 mins |

**What you need:**
- **Flutter SDK**: Version 3.7.0 or higher
- **Dart SDK**: Version 3.0 or higher (included with Flutter)
- **Code Editor**: VS Code or Android Studio (explained in videos)
- **Device**: iOS Simulator / Android Emulator or physical device

**Quick Check:** After installing Flutter, open your terminal/command prompt and run:
```bash
flutter doctor
```
This command checks if Flutter is properly installed and shows what else you need.

#### For Experienced Developers

If you already have Flutter installed, ensure you have:
- Flutter SDK 3.7.0+
- Dart SDK 3.0+
- Xcode (for iOS) or Android Studio (for Android)

### One-Command Setup

```bash
./setup.sh
```

The setup script will:
1. Check Flutter installation
2. Get all dependencies
3. Run code generation (Freezed, JSON Serializable, Riverpod)
4. Run tests
5. Run static analysis

### Manual Setup

If you prefer manual setup:

```bash
# 1. Get dependencies
flutter pub get

# 2. Generate code
dart run build_runner build --delete-conflicting-outputs

# 3. Run the app
flutter run
```

### Step-by-Step Guide for Beginners

**Never used Flutter before?** Follow these simple steps:

#### Step 1: Install Flutter
1. Watch the video tutorial for your platform (see Prerequisites section above)
2. Follow along with the video to install Flutter
3. Open your terminal/command prompt and run `flutter doctor` to verify installation

#### Step 2: Download This Project
Choose one of these methods:

**Option A: Download as ZIP** (Easiest for beginners)
1. Click the green "Code" button on GitHub
2. Click "Download ZIP"
3. Extract the ZIP file to a folder on your computer

**Option B: Using Git** (If you have Git installed)
```bash
git clone [your-repository-url]
cd drop_prototype
```

#### Step 3: Open the Project
1. Open VS Code or Android Studio
2. Click "File" → "Open Folder"
3. Select the `drop_prototype` folder

#### Step 4: Run Setup Script
Open the terminal in your code editor (or navigate to the project folder in your system terminal) and run:

**On macOS/Linux:**
```bash
chmod +x setup.sh
./setup.sh
```

**On Windows:**
```bash
sh setup.sh
```

This script will automatically:
- ✅ Check if Flutter is installed correctly
- ✅ Download all required packages
- ✅ Generate necessary code files
- ✅ Run tests to make sure everything works
- ✅ Check for any issues

#### Step 5: Connect a Device

**Option A: Use an Emulator/Simulator**
- **Android**: Open Android Studio → Tools → AVD Manager → Create Virtual Device
- **iOS** (Mac only): Open Simulator app (comes with Xcode)

**Option B: Use Your Physical Phone**
- **Android**: Enable Developer Mode and USB Debugging ([guide](https://developer.android.com/studio/debug/dev-options))
- **iOS**: Connect via cable and trust the computer

Check connected devices:
```bash
flutter devices
```

#### Step 6: Run the App
```bash
flutter run
```

The app will build and launch on your connected device! 🎉

**First time running?** It may take 2-5 minutes to build. Subsequent runs are much faster.

### Common Issues for Beginners

**❌ "flutter: command not found"**
- Solution: Flutter is not installed or not in your PATH. Rewatch the installation video.

**❌ "No devices found"**
- Solution: Connect a device or start an emulator (see Step 5 above)

**❌ "Could not find a file named 'pubspec.yaml'"**
- Solution: Make sure you're in the `drop_prototype` folder in your terminal

**❌ Build errors or missing files**
- Solution: Run the setup script again: `./setup.sh`

**Need more help?** Check the Troubleshooting section below or the [official Flutter documentation](https://docs.flutter.dev/).

## 🧪 Testing

The project includes comprehensive tests:

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/features/products/data/models/product_test.dart
```

### Test Coverage

- ✅ **Unit Tests**: Product model, datasource, repository (25+ tests)
- ✅ **Widget Tests**: App launch and UI components
- ✅ **Integration Tests**: Ready for implementation

Current test results: **26 tests passing**

## 📦 Project Structure Details

### Core Files

| File/Folder | Purpose |
|------------|---------|
| `lib/main.dart` | App entry point with ProviderScope |
| `lib/core/constants/` | Spacing, colors, API endpoints |
| `lib/core/theme/` | Material 3 theme configuration |
| `lib/core/router/` | GoRouter setup with type-safe routes |

### Features - Products Module

| Layer | Files | Purpose |
|-------|-------|---------|
| **Domain** | `entities/product_entity.dart` | Pure business object |
| | `repositories/product_repository.dart` | Repository interface |
| **Data** | `models/product.dart` | Freezed model with JSON serialization |
| | `datasources/mock_supabase_datasource.dart` | Mock API with 15 products |
| | `repositories/product_repository_impl.dart` | Repository implementation |
| **Presentation** | `providers/product_providers.dart` | Riverpod state management |
| | `screens/product_feed_screen.dart` | Grid view of products |
| | `screens/product_detail_screen.dart` | Detailed product view |
| | `widgets/product_card.dart` | Reusable product card |
| | `widgets/product_grid_shimmer.dart` | Loading skeleton |

## 🔄 Switching to Real Supabase

The mock data source is structured to match Supabase's JSON format. To switch to real Supabase:

1. **Add Supabase Configuration** in `main.dart`:
```dart
await Supabase.initialize(
  url: 'YOUR_SUPABASE_URL',
  anonKey: 'YOUR_SUPABASE_ANON_KEY',
);
```

2. **Create SupabaseDataSource**:
```dart
class SupabaseDataSource {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<Product>> getAllProducts() async {
    final response = await _client
        .from('products')
        .select()
        .order('created_at', ascending: false);

    return (response as List)
        .map((json) => Product.fromJson(json))
        .toList();
  }
}
```

3. **Update Repository** in `product_repository_impl.dart`:
```dart
ProductRepositoryImpl({
  SupabaseDataSource? dataSource,  // Change from MockSupabaseDataSource
}) : _dataSource = dataSource ?? SupabaseDataSource();
```

That's it! No changes needed in the domain layer or presentation layer.

## 🎨 Design Decisions

### Why Riverpod?
- **Code Generation**: Type-safe providers with `@riverpod`
- **Performance**: Fine-grained rebuilds
- **DevTools**: Excellent debugging support
- **Modern**: Recommended by Flutter team

### Why Freezed?
- **Immutability**: Prevents accidental state mutations
- **Equality**: Automatic `==` and `hashCode`
- **CopyWith**: Easy state updates
- **JSON**: Seamless serialization

### Why GoRouter?
- **Type Safety**: Compile-time route checking
- **Deep Linking**: Built-in support
- **Declarative**: Modern routing approach
- **Web Ready**: Works on Flutter web

### Why Mock Data?
- **Fast Prototyping**: No backend setup required
- **Realistic Structure**: Matches Supabase JSON format
- **Easy Migration**: Switch to real API with minimal changes
- **Demonstration**: Shows architectural flexibility

## 📊 Mock Data

The app includes 15 products across 4 categories:

- **Electronics** (4 products): Headphones, Smart Watch, Gaming Mouse, USB-C Hub
- **Fashion** (3 products): Leather Jacket, Sunglasses, Denim Jeans
- **Home** (4 products): Desk Lamp, Coffee Mugs, Wall Clock, Aromatherapy Diffuser
- **Sports** (4 products): Yoga Mat, Water Bottle, Resistance Bands, Running Shoes

All products include high-quality Unsplash images.

## 🚨 Troubleshooting

### Code Generation Issues

If you see errors about missing `.freezed.dart` or `.g.dart` files:

```bash
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

### Build Issues

```bash
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

### Test Failures

Make sure all generated files exist:

```bash
dart run build_runner build --delete-conflicting-outputs
flutter test
```

## 📝 Key Learnings

This project demonstrates:

1. **Clean Architecture**: Proper layer separation
2. **SOLID Principles**: Especially Dependency Inversion
3. **Code Generation**: Reducing boilerplate with build_runner
4. **State Management**: Modern Riverpod patterns
5. **Testing**: Unit, widget, and integration tests
6. **Type Safety**: Leveraging Dart's type system
7. **Professional Polish**: Animations, loading states, error handling

## 🎯 Future Enhancements

- [ ] Real Supabase integration
- [ ] Product search and filtering
- [ ] Shopping cart functionality
- [ ] User authentication
- [ ] Offline support with local database
- [ ] Product favorites/wishlist
- [ ] Dark mode support
- [ ] Accessibility improvements

## 📄 License

This project is created as a skills assessment prototype.

## 🤝 Contact

**Developer**: Arslan Yousaf
**Purpose**: Skills Assessment Prototype
**Date**: November 2024

---

Built with ❤️ using Flutter and Clean Architecture principles.
