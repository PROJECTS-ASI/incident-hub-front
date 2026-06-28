class User {
  final String email;
  final String password;
  final String name;
  final String lastName;
  final String role; //ADMIN - STUDENT - TEACHER - TECHNICAL_SUPPORT
  final String cellphone;
  final String direction;
  final String document;
  final DateTime createdDate;
  final DateTime updatedDate;

  User({
    required this.email,
    required this.password,
    required this.name,
    required this.lastName,
    required this.role,
    required this.cellphone,
    required this.direction,
    required this.document,
    required this.createdDate,
    required this.updatedDate,
  });

  User update({
    String? name,
    String? lastName,
    String? role,
    String? cellphone,
    String? direction,
    String? document,
    DateTime? createdDate,
    DateTime? updatedDate,
  }) {
    return User(
      email: email,
      password: password,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      role: role ?? this.role,
      cellphone: cellphone ?? this.cellphone,
      direction: direction ?? this.direction,
      document: document ?? this.document,
      createdDate: createdDate ?? this.createdDate,
      updatedDate: updatedDate ?? this.updatedDate,
    );
  }
}

class UserRepository {
  static final List<User> users = [
     User(
      name: 'Jesus Antonio',
      lastName: 'Atauqui Tito',
      email: 'atauqui15@gmail.com',
      password: 'atauqui77',
      role: 'ADMIN',
      cellphone: "",
      direction: "",
      document: "",
      createdDate: DateTime(2026, 6, 22, 15, 55, 30),
      updatedDate: DateTime(2026, 6, 22, 15, 55, 30),
    ),
  ];

  static void addUser(User user) {
    users.add(user);
  }

  static bool updateUser({ 
    required String email,
    required String name,
    required String lastName,
    required String cellphone,
    required String direction,
    required String document,
    required DateTime updatedDate,
  }) {
    final index = users.indexWhere((u) => u.email == email);

    if (index == -1) {
      return false;
    }

    final record = users[index];
    users[index] = record.update(
      name: name,
      lastName: lastName,
      cellphone: cellphone,
      direction: direction,
      document: document,
      updatedDate: updatedDate,
    );
    return true;
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

  static User? getUserByEmail(String email) {
    try {
      return users.firstWhere(
        (u) => u.email == email,
      );
    } catch (e) {
      return null;
    }
  }
}

class UserSession {
  static String? currentEmail;

  static void logout() {
    currentEmail = null;
  }
}