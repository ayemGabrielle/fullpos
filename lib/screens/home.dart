import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'products.dart'; // Ensure this import is correct

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

<<<<<<< HEAD
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _avatarUrl;
  String? _userName;
  List<Products> products = []; // Define the products list
<<<<<<< HEAD
  String currentRoute = '/main'; // Track the current route
  double totalSalesAmount = 0.0; // Total sales amount
  int totalSalesCount = 0; // Total sales count
=======
>>>>>>> origin/main

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _loadProducts(); // Load products when the screen initializes
<<<<<<< HEAD
    _fetchSalesData(); // Load sales data
=======
>>>>>>> origin/main
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _avatarUrl = prefs.getString('avatarUrl') ?? 'https://example.com/default-avatar.png';
      _userName = prefs.getString('name') ?? 'Guest';
    });
  }

  Future<void> _loadProducts() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      products = Products.listFromJson(prefs.getStringList('products') ?? []);
    });
  }

<<<<<<< HEAD
  Future<void> _fetchSalesData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      totalSalesAmount = prefs.getDouble('totalSalesAmount') ?? 0.0;
      totalSalesCount = prefs.getInt('totalSalesCount') ?? 0;
    });
  }

  void _onProductsChanged() {
    _loadProducts(); // Reload products when changed
  }

  void _showNotificationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notifications'),
          content: Text('No new notifications'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required String routeName,
  }) {
    final bool isActive = currentRoute == routeName;

    return ListTile(
      leading: Icon(icon, color: const Color.fromARGB(255, 55, 56, 55)), // Primary color
      title: Text(
        text,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
      tileColor: isActive ? const Color.fromARGB(188, 76, 175, 79) : null, // Highlight color
      onTap: () {
        Navigator.pushReplacementNamed(context, routeName);
        setState(() {
          currentRoute = routeName; // Update current route
        });
      },
    );
  }
=======
  void _onProductsChanged() {
    _loadProducts(); // Reload products when changed
  }
=======
class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);
>>>>>>> 3f10508f32fd3e5694524823dbf51388b8a8e209

  // Example list of products
  final List<Product> products = const [
    Product(
      name: 'Product 1',
      description: 'Description of Product 1',
      image: 'assets/product1.jpg',
    ),
    Product(
      name: 'Product 2',
      description: 'Description of Product 2',
      image: 'assets/product2.jpg',
    ),
    // Add more products as needed
  ];
>>>>>>> origin/main

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = screenHeight * 0.25; // Adjust this factor as needed

    return Scaffold(
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> origin/main
      body: Column(
        children: [
          // AppBar
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              child: Container(
                height: appBarHeight, // Responsive height
                width: double.infinity, // Full width of the screen
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  flexibleSpace: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0).copyWith(top: appBarHeight * 0.2), // Adjust vertical padding
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start, // Align items to the start (left)
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: appBarHeight * 0.25, // Adjust size relative to AppBar height
                          backgroundImage: NetworkImage(_avatarUrl ?? ''),
                        ),
                        SizedBox(width: 12), // Adjust spacing between avatar and text
                        Expanded(
                          child: Text(
<<<<<<< HEAD
                            _userName ?? 'Guest',
=======
                            'Welcome, $_userName!',
>>>>>>> origin/main
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: appBarHeight * 0.1, // Adjust text size relative to AppBar height
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            overflow: TextOverflow.ellipsis, // Ensure text fits
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.notifications, color: Colors.white),
<<<<<<< HEAD
                      onPressed: _showNotificationDialog, // Show notification dialog
                    ),
                    SizedBox(width: 16),
                  ],
=======
                      onPressed: () {
                        // Handle notifications
                      },
                    ),
                    SizedBox(width: 16),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 8), // Adjust space between AppBar and the next content
          // Main content of the screen
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Horizontal padding for content
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Overview text
                  Text(
                    '  Overview',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 30, // Adjust text size as needed
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(height: 16), // Space below the Overview text
                  // Transactions and Sales Cards
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.symmetric(horizontal: 8.0), // Add margin to cards
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0), // Adjust padding inside the card
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Transactions',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 16, // Smaller text size
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '1,2324',
                                  style: GoogleFonts.poppins(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.symmetric(horizontal: 8.0), // Add margin to cards
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0), // Adjust padding inside the card
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sales',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 16, // Smaller text size
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '15,242',
                                  style: GoogleFonts.poppins(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
=======
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: GoogleFonts.poppins(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Overview',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
>>>>>>> origin/main
                ),
              ),
            ),
          ),
          SizedBox(height: 8), // Adjust space between AppBar and the next content
          // Main content of the screen
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Horizontal padding for content
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Overview text
                  Text(
                    'Overview',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 30, // Adjust text size as needed
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(height: 16), // Space below the Overview text
                  // Transactions and Sales Cards
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.symmetric(horizontal: 8.0), // Add margin to cards
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0), // Adjust padding inside the card
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Transactions',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 16, // Smaller text size
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '$totalSalesCount', // Display total sales count
                                  style: GoogleFonts.poppins(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
<<<<<<< HEAD
                        child: Card(
                          margin: const EdgeInsets.symmetric(horizontal: 8.0), // Add margin to cards
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0), // Adjust padding inside the card
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sales',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 16, // Smaller text size
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '₱${totalSalesAmount.toStringAsFixed(2)}', // Display total sales amount
                                  style: GoogleFonts.poppins(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
=======
                        child: ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(products[index].image),
                              ),
                              title: Text(
                                products[index].name,
                                style: GoogleFonts.poppins(color: Colors.black),
                              ),
                              subtitle: Text(
                                products[index].description,
                                style: GoogleFonts.poppins(color: Colors.black),
                              ),
                            );
                          },
>>>>>>> 3f10508f32fd3e5694524823dbf51388b8a8e209
>>>>>>> origin/main
                        ),
                      ),
                    ],
                  ),
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> origin/main
                  SizedBox(height: 16),
                  // Products Card
                  Expanded(
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0), // Add margin to card
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0), // Adjust padding inside the card
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Products',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 16, // Smaller text size
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Expanded(
                              child: ListView.builder(
                                itemCount: products.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: CircleAvatar(
                                      radius: 20, // Smaller leading avatar
                                      backgroundImage: products[index].picture.isNotEmpty
                                          ? NetworkImage(products[index].picture)
                                          : null,
                                      child: products[index].picture.isEmpty
                                          ? Icon(Icons.shopping_bag, size: 20) // Adjust icon size
                                          : null,
                                    ),
                                    title: Text(
                                      products[index].name,
                                      style: GoogleFonts.poppins(color: Colors.black),
                                    ),
                                    subtitle: Text(
<<<<<<< HEAD
                                      '\₱${products[index].price.toStringAsFixed(2)}',
=======
                                      '\$${products[index].price.toStringAsFixed(2)}',
>>>>>>> origin/main
                                      style: GoogleFonts.poppins(color: Colors.black),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
<<<<<<< HEAD
              ),
            ),
          ),
        ],
=======
              ),
            ),
          ),
        ],
=======
                ),
              ),
            ),
          ],
        ),
>>>>>>> 3f10508f32fd3e5694524823dbf51388b8a8e209
>>>>>>> origin/main
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(_avatarUrl ?? ''),
                    radius: 30,
                  ),
                  SizedBox(width: 16), // Space between avatar and name
                  Expanded(
                    child: Text(
                      _userName ?? '',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
<<<<<<< HEAD
            _buildDrawerItem(
              icon: Icons.home,
              text: 'Home',
              routeName: '/main',
            ),
            _buildDrawerItem(
              icon: Icons.dashboard,
              text: 'Dashboard',
              routeName: '/dashboard',
            ),
            _buildDrawerItem(
              icon: Icons.attach_money,
              text: 'Sales',
              routeName: '/sales',
            ),
            _buildDrawerItem(
              icon: Icons.shopping_bag,
              text: 'Products',
              routeName: '/products',
            ),
            _buildDrawerItem(
              icon: Icons.people,
              text: 'Account',
              routeName: '/account',
            ),
            _buildDrawerItem(
              icon: Icons.logout,
              text: 'Logout',
              routeName: '/logout',
=======
            ListTile(
<<<<<<< HEAD
              title: Text(
                'Dashboard',
                style: GoogleFonts.poppins(color: Colors.black),
              ),
=======
              title: Text('Dashboard', style: GoogleFonts.poppins(color: Colors.black)),
>>>>>>> 3f10508f32fd3e5694524823dbf51388b8a8e209
              leading: const Icon(Icons.dashboard),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
            ),
            ListTile(
<<<<<<< HEAD
              title: Text(
                'Sales',
                style: GoogleFonts.poppins(color: Colors.black),
              ),
=======
              title: Text('Sales', style: GoogleFonts.poppins(color: Colors.black)),
>>>>>>> 3f10508f32fd3e5694524823dbf51388b8a8e209
              leading: const Icon(Icons.attach_money),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/sales');
              },
            ),
            ListTile(
<<<<<<< HEAD
              title: Text(
                'Products',
                style: GoogleFonts.poppins(color: Colors.black),
              ),
=======
              title: Text('Products', style: GoogleFonts.poppins(color: Colors.black)),
>>>>>>> 3f10508f32fd3e5694524823dbf51388b8a8e209
              leading: const Icon(Icons.shopping_bag),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductsScreen(
                      onProductsChanged: _onProductsChanged,
                    ),
                  ),
                );
              },
            ),
            ListTile(
<<<<<<< HEAD
              title: Text(
                'Account',
                style: GoogleFonts.poppins(color: Colors.black),
              ),
=======
              title: Text('Account', style: GoogleFonts.poppins(color: Colors.black)),
>>>>>>> 3f10508f32fd3e5694524823dbf51388b8a8e209
              leading: const Icon(Icons.people),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/account');
              },
            ),
            ListTile(
<<<<<<< HEAD
              title: Text(
                'Logout',
                style: GoogleFonts.poppins(color: Colors.black),
              ),
=======
              title: Text('Logout', style: GoogleFonts.poppins(color: Colors.black)),
>>>>>>> 3f10508f32fd3e5694524823dbf51388b8a8e209
              leading: const Icon(Icons.logout),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/logout');
              },
>>>>>>> origin/main
            ),
          ],
        ),
      ),
    );
  }
}
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======

class Product {
  final String name;
  final String description;
  final String image;

  const Product({
    required this.name,
    required this.description,
    required this.image,
  });
}
>>>>>>> 3f10508f32fd3e5694524823dbf51388b8a8e209
>>>>>>> origin/main
