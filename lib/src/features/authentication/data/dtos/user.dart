import 'dart:convert';

class UserDTO {
  UserDTO(this.firstname, this.surname, this.email, this.password);
  String firstname;
  String surname;
  String email;
  String password;

  factory UserDTO.fromJson(Map<String, dynamic> json) => UserDTO(
      json["firstname"],
      json["surname"],
      json["email"],
      json["password"] ?? "");

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "surname": surname,
        "email": email,
        "password": password
      };

  static UserDTO decodeFromJson(String str) =>
      json.decode(str).map((x) => UserDTO.fromJson(x));

  String encodeToJson() => json.encode(toJson());
}
