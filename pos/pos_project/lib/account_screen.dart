import 'package:flutter/material.dart';
import 'user.dart'; // Import the User class
import 'database_helper.dart'; // Import the DatabaseHelper class

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  DatabaseHelper dbHelper = DatabaseHelper();
  User? currentUser;
  bool _showPassword = false; // State variable to toggle password visibility

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    List<User> users = await dbHelper.getUsers();
    if (users.isNotEmpty) {
      setState(() {
        currentUser = users.first; // Assuming there's only one user for this example
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: currentUser == null
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Username: ${currentUser!.username}'),
                  Text('Email: ${currentUser!.email}'),
                  const SizedBox(height: 20),
                  TextFormField(
                    initialValue: currentUser!.name,
                    onChanged: (value) {
                      setState(() {
                        currentUser!.name = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    initialValue: currentUser!.password,
                    onChanged: (value) {
                      setState(() {
                        currentUser!.password = value;
                      });
                    },
                    obscureText: !_showPassword, // Toggle obscureText based on _showPassword
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _showPassword ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      await dbHelper.updateUser(currentUser!);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Account details updated')),
                      );
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
      ),
    );
  }
}
