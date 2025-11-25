/// App-wide constants for the Drop Prototype application
class AppConstants {
  AppConstants._(); // Private constructor to prevent instantiation

  // App Information
  static const String appName = 'Drop';
  static const String appVersion = '1.0.0';

  // Spacing
  static const double spacingXs = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXl = 32.0;
  static const double spacingXxl = 48.0;

  // Border Radius
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0;
  static const double radiusXl = 24.0;

  // Grid Layout
  static const int gridCrossAxisCount = 2;
  static const double gridCrossAxisSpacing = 16.0;
  static const double gridMainAxisSpacing = 16.0;
  static const double gridChildAspectRatio = 0.75;

  // Image Dimensions
  static const double productCardImageHeight = 200.0;
  static const double productDetailImageHeight = 400.0;

  // Animation Durations
  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationNormal = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);

  // API Configuration (Ready for Supabase integration)
  static const String apiBaseUrl = 'https://api.example.com'; // Replace with Supabase URL
  static const Duration apiTimeout = Duration(seconds: 30);

  // Product Categories
  static const List<String> productCategories = [
    'Electronics',
    'Fashion',
    'Home',
    'Sports',
  ];
}
