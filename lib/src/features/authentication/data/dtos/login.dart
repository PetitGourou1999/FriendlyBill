import 'dart:convert';

class LoginDTO {
  LoginDTO({required this.email, required this.password});
  String email;
  String password;

  Map<String, dynamic> _toJson() => {"email": email, "password": password};

  String encodeToJson() => json.encode(_toJson());
}
