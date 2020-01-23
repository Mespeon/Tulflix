import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:tulflix/model/llsifModel.dart';

String baseUrl = 'https://marknolledo.pythonanywhere.com/sibyl/';

/// F U T U R E
Future<Stargazer> getMembers() async {
  var url = baseUrl + 'ionic/stargazer';
  final response = await http.get(url);
  return stargazerFromJson(json.decode(response.body));
}

// Boilnierplate login auth + registration
// Future<http.Response> login(action, data) async {
//   print(action);
//   var nierplate = boilnierplate;
//   if (action == 'login') {
//     nierplate += 'api/auth';
//   }
//   else if (action == 'register') {
//     nierplate += 'api/user';
//   }

//   final response = await http.post(
//     nierplate,
//     headers: {HttpHeaders.contentTypeHeader: 'application/json'},
//     body: loginToJson(data)
//   );

//   if (response.statusCode < 200 || response.statusCode > 400) {
//     throw new Exception('Something went wrong with the request.');
//   }
//   else {
//     return response;
//   }
// }