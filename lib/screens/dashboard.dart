import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< HEAD
import 'package:shared_preferences/shared_preferences.dart';
=======
import 'home.dart'; // Import your HomeScreen
import 'sales.dart'; // Import other screens as needed
import 'products.dart'; // Import other screens as needed
import 'account.dart'; // Import other screens as needed

>>>>>>> origin/main

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _userName = 'Default User'; // Default user name
  String _avatarUrl = 'assets/default_avatar.png'; // Default avatar URL
  String currentRoute = '/dashboard'; // Default route

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final route = ModalRoute.of(context)?.settings.name;
      if (route != null) {
        setState(() {
          currentRoute = route;
        });
      }
    });
  }

  Future<void> _fetchUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('name') ?? 'Default User';
      _avatarUrl = prefs.getString('avatarUrl') ?? 'assets/default_avatar.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.green, // Primary color
      ),
      drawer: _buildDrawer(),
      body: Center(
        child: Text(
          'Dashboard Content',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green, // Primary color
            ),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(_avatarUrl),
                  radius: 30,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    _userName, // User name
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    overflow: TextOverflow.ellipsis, // Ensure text fits
                  ),
                ),
              ],
            ),
<<<<<<< HEAD
          ),
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
          ),
        ],
=======
            ListTile(
              title: Text(
                'Home',
                style: GoogleFonts.poppins(color: Colors.black),
              ),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            ListTile(
              title: Text(
                'Dashboard',
                style: GoogleFonts.poppins(color: Colors.black),
              ),
              leading: const Icon(Icons.dashboard),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
            ),
            ListTile(
              title: Text(
                'Sales',
                style: GoogleFonts.poppins(color: Colors.black),
              ),
              leading: const Icon(Icons.attach_money),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/sales');
              },
            ),
            ListTile(
              title: Text(
                'Products',
                style: GoogleFonts.poppins(color: Colors.black),
              ),
              leading: const Icon(Icons.shopping_bag),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/products');
              },
            ),
            ListTile(
              title: Text(
                'Account',
                style: GoogleFonts.poppins(color: Colors.black),
              ),
              leading: const Icon(Icons.people),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/account');
              },
            ),
            ListTile(
              title: Text(
                'Logout',
                style: GoogleFonts.poppins(color: Colors.black),
              ),
              leading: const Icon(Icons.logout),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Dashboard Content',
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
        ),
>>>>>>> origin/main
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required String routeName,
  }) {
    final bool isActive = currentRoute == routeName;

    return ListTile(
      leading: Icon(icon, color: Color.fromARGB(255, 55, 56, 55)), // Primary color
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
}
