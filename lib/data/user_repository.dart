class User {
  final String email;
  final String password;
  final String name;
  final String role; //ADMIN - STUDENT - TEACHER - TECHNICAL_SUPPORT
  final DateTime createdDate;
  final DateTime updatedDate;

  User({
    required this.email,
    required this.password,
    required this.name,
    required this.role,
    required this.createdDate,
    required this.updatedDate,
  });
}

class UserRepository {
  static final List<User> users = [
     User(
      name: 'Jesus Antonio Atauqui Tito',
      email: 'atauqui15@gmail.com',
      password: 'atauqui77',
      role: 'ADMIN',
      createdDate: DateTime(2026, 6, 22, 15, 55, 30),
      updatedDate: DateTime(2026, 6, 22, 15, 55, 30),
    ),
  ];

  static void addUser(User user) {
    users.add(user);
  }

  static User? login(String email, String password) {
    try {
      return users.firstWhere(
        (u) => u.email == email && u.password == password,
      );
    } catch (error) {
      return null;
    }
  }

  static bool emailExists(String email) {
    return users.any((u) => u.email == email);
  }
}

class UserSession {
  static User? currentUser;
}