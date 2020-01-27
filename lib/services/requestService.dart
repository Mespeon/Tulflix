import 'package:tulflix/model/models.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

String baseUrl = 'https://marknolledo.pythonanywhere.com/sibyl/';
String apiUrl = baseUrl + 'api/';

Future<GetToken> getToken() async {
  var url = apiUrl + 'token';
  print(url);
  final response = await http.post(url);
  return getTokenFromJson(response.body);
}