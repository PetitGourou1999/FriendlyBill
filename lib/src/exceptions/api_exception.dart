import 'dart:convert';

import 'package:http/http.dart';

class APIException implements Exception {
  APIException({required this.response}) {
    message = APIExceptionDTO.decodeFromJson(response.body).message;
  }
  final Response response;
  late final String message;
}

class APIExceptionDTO {
  const APIExceptionDTO({required this.message});
  final String message;

  factory APIExceptionDTO._fromJson(Map<String, dynamic> json) =>
      APIExceptionDTO(message: json["message"]);

  static APIExceptionDTO decodeFromJson(String str) =>
      APIExceptionDTO._fromJson(json.decode(str));
}
