import 'dart:convert';

import 'user.dart';

class AuthenticatedUserDTO {
  AuthenticatedUserDTO({required this.token, required this.user});
  final String token;
  final UserDTO user;

  factory AuthenticatedUserDTO._fromJson(Map<String, dynamic> json) =>
      AuthenticatedUserDTO(
          token: json["token"], user: UserDTO.fromJson(json["user"]));

  static AuthenticatedUserDTO decodeFromJson(String str) =>
      AuthenticatedUserDTO._fromJson(json.decode(str));
}
