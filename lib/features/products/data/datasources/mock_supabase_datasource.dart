import 'package:drop_prototype/features/products/data/models/product.dart';

/// Mock Supabase Data Source
///
/// This simulates a real Supabase API with:
/// - Realistic product data across 4 categories
/// - JSON structure matching Supabase response format
/// - Simulated network delay for realistic UX
///
/// To switch to real Supabase:
/// 1. Replace this class with SupabaseDataSource
/// 2. Inject Supabase client
/// 3. Replace _mockProducts with actual Supabase queries
/// 4. No changes needed in repository or presentation layers!
class MockSupabaseDataSource {
  /// Simulated network delay (500ms)
  Future<void> _simulateNetworkDelay() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  /// Mock product data - structured as Supabase JSON responses
  ///
  /// Using high-quality Unsplash images for professional look
  final List<Map<String, dynamic>> _mockProducts = [
    // Electronics Category
    {
      'id': '1',
      'title': 'Wireless Headphones Pro',
      'description':
          'Premium wireless headphones with active noise cancellation, 30-hour battery life, and studio-quality sound. Perfect for music lovers and professionals.',
      'price': 299.99,
      'image_url': 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e',
      'category': 'Electronics',
      'created_at': '2024-01-15T10:00:00Z',
    },
    {
      'id': '2',
      'title': 'Smart Watch Ultra',
      'description':
          'Advanced fitness tracking, heart rate monitoring, GPS, and 7-day battery life. Water-resistant up to 50m. Compatible with iOS and Android.',
      'price': 449.99,
      'image_url': 'https://images.unsplash.com/photo-1523275335684-37898b6baf30',
      'category': 'Electronics',
      'created_at': '2024-01-14T09:30:00Z',
    },
    {
      'id': '3',
      'title': 'Wireless Gaming Mouse',
      'description':
          'Precision gaming mouse with 16,000 DPI, RGB lighting, and programmable buttons. Ergonomic design for extended gaming sessions.',
      'price': 89.99,
      'image_url': 'https://images.unsplash.com/photo-1527814050087-3793815479db',
      'category': 'Electronics',
      'created_at': '2024-01-13T14:20:00Z',
    },
    {
      'id': '4',
      'title': '4K USB-C Hub',
      'description':
          'Multi-port USB-C hub with 4K HDMI output, USB 3.0 ports, SD card reader, and 100W power delivery. Essential for laptops and tablets.',
      'price': 79.99,
      'image_url': 'https://images.unsplash.com/photo-1625948515291-69613efd103f',
      'category': 'Electronics',
      'created_at': '2024-01-12T11:00:00Z',
    },

    // Fashion Category
    {
      'id': '5',
      'title': 'Classic Leather Jacket',
      'description':
          'Genuine leather jacket with timeless design. Premium quality craftsmanship with durable YKK zippers and soft inner lining. Available in multiple sizes.',
      'price': 349.99,
      'image_url': 'https://images.unsplash.com/photo-1551028719-00167b16eac5',
      'category': 'Fashion',
      'created_at': '2024-01-11T16:45:00Z',
    },
    {
      'id': '6',
      'title': 'Designer Sunglasses',
      'description':
          'Luxury sunglasses with UV400 protection and polarized lenses. Lightweight titanium frame with scratch-resistant coating. Includes premium case.',
      'price': 199.99,
      'image_url': 'https://images.unsplash.com/photo-1511499767150-a48a237f0083',
      'category': 'Fashion',
      'created_at': '2024-01-10T13:30:00Z',
    },
    {
      'id': '7',
      'title': 'Premium Denim Jeans',
      'description':
          'Comfort-stretch denim jeans with classic fit. Made from sustainable organic cotton. Reinforced stitching for durability. Multiple wash options available.',
      'price': 89.99,
      'image_url': 'https://images.unsplash.com/photo-1542272604-787c3835535d',
      'category': 'Fashion',
      'created_at': '2024-01-09T10:15:00Z',
    },

    // Home Category
    {
      'id': '8',
      'title': 'Smart LED Desk Lamp',
      'description':
          'Adjustable color temperature (2700K-6500K), touch controls, and USB charging port. Eye-caring technology reduces eye strain during work or study.',
      'price': 59.99,
      'image_url': 'https://images.unsplash.com/photo-1507473885765-e6ed057f782c',
      'category': 'Home',
      'created_at': '2024-01-08T15:20:00Z',
    },
    {
      'id': '9',
      'title': 'Ceramic Coffee Mug Set',
      'description':
          'Set of 4 handcrafted ceramic mugs with unique glaze patterns. Microwave and dishwasher safe. Perfect for coffee, tea, or hot chocolate. 12oz capacity.',
      'price': 39.99,
      'image_url': 'https://images.unsplash.com/photo-1514228742587-6b1558fcca3d',
      'category': 'Home',
      'created_at': '2024-01-07T09:45:00Z',
    },
    {
      'id': '10',
      'title': 'Modern Wall Clock',
      'description':
          'Minimalist wall clock with silent quartz movement. Sleek design fits any interior style. Easy to read from distance. Requires 1 AA battery (not included).',
      'price': 34.99,
      'image_url': 'https://images.unsplash.com/photo-1563861826100-9cb868fdbe1c',
      'category': 'Home',
      'created_at': '2024-01-06T12:00:00Z',
    },
    {
      'id': '11',
      'title': 'Aromatherapy Diffuser',
      'description':
          'Ultrasonic essential oil diffuser with color-changing LED lights. Whisper-quiet operation, auto-shutoff safety feature. Creates calming atmosphere at home.',
      'price': 44.99,
      'image_url': 'https://images.unsplash.com/photo-1608571423902-eed4a5ad8108',
      'category': 'Home',
      'created_at': '2024-01-05T14:30:00Z',
    },

    // Sports Category
    {
      'id': '12',
      'title': 'Yoga Mat Pro',
      'description':
          'Non-slip, eco-friendly yoga mat with 6mm thickness for extra cushioning. Includes carrying strap. Perfect for yoga, pilates, and floor exercises.',
      'price': 49.99,
      'image_url': 'https://images.unsplash.com/photo-1601925260368-ae2f83cf8b7f',
      'category': 'Sports',
      'created_at': '2024-01-04T11:20:00Z',
    },
    {
      'id': '13',
      'title': 'Insulated Water Bottle',
      'description':
          'Stainless steel water bottle keeps drinks cold for 24hrs or hot for 12hrs. Leak-proof lid, wide mouth for easy cleaning. BPA-free. 32oz capacity.',
      'price': 29.99,
      'image_url': 'https://images.unsplash.com/photo-1602143407151-7111542de6e8',
      'category': 'Sports',
      'created_at': '2024-01-03T16:10:00Z',
    },
    {
      'id': '14',
      'title': 'Resistance Bands Set',
      'description':
          'Set of 5 resistance bands with different tension levels. Includes door anchor, handles, and ankle straps. Perfect for home workouts and physical therapy.',
      'price': 24.99,
      'image_url': 'https://images.unsplash.com/photo-1598289431512-b97b0917affc',
      'category': 'Sports',
      'created_at': '2024-01-02T10:45:00Z',
    },
    {
      'id': '15',
      'title': 'Running Shoes Pro',
      'description':
          'Lightweight running shoes with responsive cushioning and breathable mesh upper. Durable rubber outsole for superior traction. Available in multiple colors.',
      'price': 129.99,
      'image_url': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
      'category': 'Sports',
      'created_at': '2024-01-01T08:00:00Z',
    },
  ];

  /// Fetch all products
  ///
  /// Simulates: SELECT * FROM products ORDER BY created_at DESC
  Future<List<Product>> getAllProducts() async {
    await _simulateNetworkDelay();

    // Simulate potential network error (uncomment to test error handling)
    // throw Exception('Network error: Unable to fetch products');

    return _mockProducts
        .map((json) => Product.fromJson(json))
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt)); // Sort by newest
  }

  /// Fetch product by ID
  ///
  /// Simulates: SELECT * FROM products WHERE id = :id LIMIT 1
  Future<Product> getProductById(String id) async {
    await _simulateNetworkDelay();

    final productJson = _mockProducts.firstWhere(
      (json) => json['id'] == id,
      orElse: () => throw Exception('Product not found with ID: $id'),
    );

    return Product.fromJson(productJson);
  }

  /// Fetch products by category
  ///
  /// Simulates: SELECT * FROM products WHERE category = :category ORDER BY created_at DESC
  Future<List<Product>> getProductsByCategory(String category) async {
    await _simulateNetworkDelay();

    final filteredProducts = _mockProducts
        .where((json) => json['category'] == category)
        .map((json) => Product.fromJson(json))
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    if (filteredProducts.isEmpty) {
      throw Exception('No products found for category: $category');
    }

    return filteredProducts;
  }
}
