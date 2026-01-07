class AppUser {
  final String uid;
  final String email;
  final String role; // customer / owner
  final String name;

  AppUser({
    required this.uid,
    required this.email,
    required this.role,
    required this.name,
  });

  factory AppUser.fromMap(Map<String, dynamic> data, String uid) {
    return AppUser(
      uid: uid,
      email: data['email'],
      role: data['role'],
      name: data['name'],
    );
  }
}
