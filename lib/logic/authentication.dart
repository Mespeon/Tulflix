import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'userrepository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


/// This code is based on the tutorial on BLoCs found in:
/// https://bloclibrary.dev/#/flutterlogintutorial

/// The abstract class for authentication states.
/// This tells us the current state of the user accessing the app.
abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

/// The abstract class for authentication events.
/// This acts upon the event triggered during the authentication process.
/// May also determine if the user of the app is logged in, logged out, or
/// the app is currently starting up.
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

/// Authentication events
class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String token;

  const LoggedIn({@required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'Logged in {token: $token}';
}

class LoggedOut extends AuthenticationEvent {}

/// Authentication states
/// App starting
class AuthenticationUninitialized extends AuthenticationState {}

/// User is logged in/authenticated
class AuthenticationAuthenticated extends AuthenticationState {}

/// User is logged out/unauthenticated
class AuthenticationUnauthenticated extends AuthenticationState {}

/// Authentication is loading or ongoing
class AuthenticationLoading extends AuthenticationState {}


/// Authentication Bloc
/// This will manage the checks and updates on user's AuthState
/// in response to AuthEvents.
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  AuthenticationBloc({@required this.userRepository}) : assert(userRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is AppStarted) {
      final bool hasToken = await userRepository.hasToken();

      if (hasToken) {
        yield AuthenticationAuthenticated();
      }
      else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await userRepository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  } 
}

/// Login states
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

/// Initial state of the form
class LoginInitial extends LoginState {}

/// Validating credentials
class LoginLoading extends LoginState {}

/// Login attempt failed
class LoginFailure extends LoginState {
  final String error;
  const LoginFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error';
}

/// Login events
abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

/// User pressed the Login button in the Login form
class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;
  const LoginButtonPressed({@required this.username, @required this.password});

  @override
  List<Object> get props => [username, password];

  @override
  String toString() => 'LoginButtonPressed {username: $username, password: $password}';
}

/// Login BLoC
/// This will handle token requests based on the given credentials,
/// as well as device token acquisitions (if any).
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc
  }) : assert(userRepository != null), assert(authenticationBloc != null);

  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.authenticate(
          username: event.username,
          password: event.password
        );

        authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      }
      catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}