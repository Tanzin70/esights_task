class UserModel {
  final String name;
  final String email;
  final String phone;
  final String password;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });
  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'phone': phone, 'password': password};
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      password: map['password'],
    );
  }
  UserModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? password,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }
}
