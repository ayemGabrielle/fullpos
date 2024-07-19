class User {
  final int? id;
  final String username;
  final String email;
  String name;
  String password;

  User({
    this.id,
    required this.username,
    required this.email,
    required this.name,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'name': name,
      'password': password,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      name: map['name'],
      password: map['password'],
    );
  }
}
