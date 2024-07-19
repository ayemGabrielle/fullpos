import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'sales_screen.dart';
import 'products_screen.dart';
import 'account_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Define constant route names
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String mainRoute = '/main';
  static const String dashboardRoute = '/dashboard';
  static const String salesRoute = '/sales';
  static const String productsRoute = '/products';
  static const String accountRoute = '/account';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: loginRoute, // Set initial route to login
        routes: {
          loginRoute: (context) => const LoginScreen(),
          registerRoute: (context) => const RegisterScreen(),
          mainRoute: (context) => const MyWidget(), // Main app screen after login
          dashboardRoute: (context) => DashboardScreen(), // Remove 'const' if no const constructor
          salesRoute: (context) => SalesScreen(), // Remove 'const' if no const constructor
          productsRoute: (context) => ProductsScreen(), // Remove 'const' if no const constructor
          accountRoute: (context) => AccountScreen(), // Remove 'const' if no const constructor
        },

      onGenerateRoute: (settings) {
        // Handle logout route
        if (settings.name == '/logout') {
          return MaterialPageRoute(builder: (context) => const LoginScreen());
        }
        return null;
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers for form fields
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement login logic here
                // For demonstration, navigate to main screen after login
                Navigator.pushReplacementNamed(context, MyApp.mainRoute);
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Navigate to registration form
                Navigator.pushNamed(context, MyApp.registerRoute);
              },
              child: const Text('Create an account'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Controllers for registration form fields
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Perform registration logic here
                // For simplicity, navigate back to login screen after registration
                Navigator.pushReplacementNamed(context, MyApp.loginRoute);
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Components'),
      ),
      body: const Center(
        child: Text('This is the Main App Screen'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 10, 204, 26),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/image.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Juan dela Cruz',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Dashboard'),
              leading: const Icon(Icons.dashboard),
              onTap: () {
                Navigator.pushNamed(context, MyApp.dashboardRoute);
              },
            ),
            ListTile(
              title: const Text('Sales'),
              leading: const Icon(Icons.attach_money),
              onTap: () {
                Navigator.pushNamed(context, MyApp.salesRoute);
              },
            ),
            ListTile(
              title: const Text('Products'),
              leading: const Icon(Icons.shopping_bag),
              onTap: () {
                Navigator.pushNamed(context, MyApp.productsRoute);
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Account'),
              leading: const Icon(Icons.people),
              onTap: () {
                Navigator.pushNamed(context, MyApp.accountRoute);
              },
            ),
            ListTile(
              title: const Text('Logout'),
              leading: const Icon(Icons.logout),
              onTap: () {
                Navigator.pushReplacementNamed(context, MyApp.loginRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
