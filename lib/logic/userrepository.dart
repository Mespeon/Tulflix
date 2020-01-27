import 'package:flutter/material.dart';
import 'package:tulflix/model/models.dart';
import 'package:tulflix/services/requestService.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// The mock user repository that represents a user's auth credentials.
/// Used by the Login BLoC in the main view.
/// This could also represent the data required or needed by a particular
/// process, such as requesting or validating a token, obtaining data that
/// somehow affects user state (suspended? promoted? elevated access?), or
/// form submissions (since a certain part of the app could be for registered users only).
class UserRepository {
  final securedstorage = new FlutterSecureStorage();
  void readStorage() async {
    Map<String, String> storageValues = await securedstorage.readAll();
  }

  /// In this class, we will handle token check (read), token store (write),
  /// and token remove (delete). Maybe we could call this class UserAuthentication.
  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<GetToken> _getToken() async {
    return await getToken();
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    /// This will also handle generation of guest access tokens (in case of guest access),
    /// device tokens, and reading from the keystore/keychain (to check if a user is already logged in).
    Future<GetToken> generateToken = _getToken();
    generateToken.then((data) {
      print(data.token);
    }).catchError((error) {
      print(error);
    });

    return false;
  }
}