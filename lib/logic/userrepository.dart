import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tulflix/model/models.dart';
import 'package:tulflix/services/requestService.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'storage.dart';

/// The mock user repository that represents a user's auth credentials.
/// Used by the Login BLoC in the main view.
/// This could also represent the data required or needed by a particular
/// process, such as requesting or validating a token, obtaining data that
/// somehow affects user state (suspended? promoted? elevated access?), or
/// form submissions (since a certain part of the app could be for registered users only).
class UserRepository {
  final storage = new FlutterSecureStorage();
  final StorageAccess storageAccess = StorageAccess();

  // Generates a token for guest access if there is no persisted token.
  // This token will then be stored in SecuredStorage (first choice) but
  // will fall back to SharedPreferences if SecuredStorage is not available.
  Future<GetToken> _getToken() async {
    return await getToken();
  }

  /// In this class, we will handle token check (read), token store (write),
  /// and token remove (delete). Maybe we could call this class UserAuthentication.
  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    var generatedToken = await _getToken();
    await persistToken(generatedToken.token);
    return generatedToken.token;
    // await Future.delayed(Duration(seconds: 1));
    // return 'token';
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    // await Future.delayed(Duration(seconds: 1));
    try {
      await storage.delete(key: 'user_token');
    }
    catch (deleteFromStorageError) {
      print('===== DeleteFromStorage error =====\n\n');
      print(deleteFromStorageError);
      print('\n\n===== Falling back to SharedPreferences =====');
      var pref = await SharedPreferences.getInstance();
      if (pref.containsKey('user_token') == true) {
        pref.remove('user_token').then((status) {
          print(status);
        });
      }
    }
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    try {
      await storage.write(key: 'user_token', value: token);
    }
    catch (writeToStorageError) {
      print('===== WriteToStorage error =====\n\n');
      print(writeToStorageError);
      print('\n\n===== Falling back to SharedPreferences =====');
      var pref = await SharedPreferences.getInstance();
      pref.setString('user_token', token).then((status) {
        print(status);
      });
    }
    // await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    /// This will also handle generation of guest access tokens (in case of guest access),
    /// device tokens, and reading from the keystore/keychain (to check if a user is already logged in).
    // Future<GetToken> generateToken = _getToken();
    // generateToken.then((data) {
    //   print(data.token);
    // }).catchError((error) {
    //   print(error);
    // });
    // await Future.delayed(Duration(seconds: 1));

    // SecureStorage with SharedPreferences fallback
    var persistedToken;
    try {
      persistedToken = await storage.read(key: 'user_token');
    }
    catch (securedStorageReadError) {
      print('===== SecuredStorage Read failure =====\n\n');
      print(securedStorageReadError);
      print('\n\n===== Falling back to SharedPreferences =====');
      var pref = await SharedPreferences.getInstance();
      if (pref.containsKey('user_token') == true) {
        persistedToken = pref.get('user_token');
      }
    }

    print('===== Persisted Token =====');
    print(persistedToken);
    return persistedToken != null ? true : false;
  }
}