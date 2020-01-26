import 'package:flutter/material.dart';

/// The mock user repository that represents a user's auth credentials.
/// Used by the Login BLoC in the main view.
/// This could also represent the data required or needed by a particular
/// process, such as requesting or validating a token, obtaining data that
/// somehow affects user state (suspended? promoted? elevated access?), or
/// form submissions (since a certain part of the app could be for registered users only).
class UserRepository {
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

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}