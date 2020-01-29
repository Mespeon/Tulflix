import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:tulflix/logic/logic.dart';
import 'userrepository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'storage.dart';


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
/// App is started
class AppStarted extends AuthenticationEvent {}

/// User is authenticated.
class LoggedIn extends AuthenticationEvent {
  final String token;

  const LoggedIn({@required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'Logged in {token: $token}';
}

// User is logged out from an authenticated view.
class LoggedOut extends AuthenticationEvent {}

/// Show walkthrough
class ShowWalkthrough extends AuthenticationEvent {}

/// Skip walkthrough
class SkipWalkthrough extends AuthenticationEvent {}

/// Walkthrough is finished
class ClearWalkthrough extends AuthenticationEvent {}

/// Authentication states
/// App starting
class AuthenticationUninitialized extends AuthenticationState {}

/// User is logged in/authenticated
class AuthenticationAuthenticated extends AuthenticationState {}

/// User is logged out/unauthenticated, and will not show walkthrough.
class AuthenticationUnauthenticated extends AuthenticationState {}

/// User is logged out/unauthenticated, and will show walkthrough.
class AuthenticationUnauthenticatedWalkthrough extends AuthenticationState{}

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
        final bool willShowWalkthrough = await userRepository.storageAccess.showWalkthrough('showwalkthrough');
        print(willShowWalkthrough);
        yield willShowWalkthrough == false || willShowWalkthrough == null ? AuthenticationUnauthenticatedWalkthrough() 
        : AuthenticationUnauthenticated();
        // yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await userRepository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    else if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }

    else if (event is ClearWalkthrough) {
      yield AuthenticationUnauthenticated();
    }
  } 
}

/// Walkthrough states
abstract class WalkthroughState extends Equatable {
  const WalkthroughState();

  @override
  List<Object> get props => [];
}

/// Walkthrough state being decided
class WalkthroughInitial extends WalkthroughState{}

class WalkthroughDecided extends WalkthroughState{
  final String walkthroughState;
  WalkthroughDecided({@required this.walkthroughState});

  @override
  List<Object> get props => [walkthroughState];

  @override
  String toString() => 'WalkthroughDecided { walkthrough: $walkthroughState}';
}

/// Walkthrough events
abstract class WalkthroughEvent extends Equatable {
  const WalkthroughEvent();
}

/// User checked the 'skip walkthrough' checkbox
class ShouldSkipWalkthrough extends WalkthroughEvent {
  final bool skipWalkthrough;
  const ShouldSkipWalkthrough({@required this.skipWalkthrough});

  @override
  List<Object> get props => [skipWalkthrough];

  @override
  String toString() => 'SkipWalkthrough updated {skipWalkthrough: $skipWalkthrough}';
}

/// The walkthrough BLoC
class WalkthroughBloc extends Bloc<WalkthroughEvent, WalkthroughState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;
  WalkthroughBloc({
    @required this.userRepository,
    @required this.authenticationBloc
  }) : assert(userRepository != null), assert(authenticationBloc != null);

  WalkthroughState get initialState => WalkthroughInitial();

  @override
  Stream<WalkthroughState> mapEventToState(WalkthroughEvent event) async* {
    if (event is ShouldSkipWalkthrough) {
      await userRepository.storageAccess.writeWalkthroughSetting('showwalkthrough', true);
      authenticationBloc.add(SkipWalkthrough());
      yield WalkthroughDecided(walkthroughState: 'Will skip walkthrough');
    }
    else if (event is! ShouldSkipWalkthrough) {
      await userRepository.storageAccess.writeWalkthroughSetting('showwalkthrough', false);
      authenticationBloc.add(ShowWalkthrough());
      yield WalkthroughDecided(walkthroughState: 'Will show walkthrough');
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
  String toString() => 'LoginFailure { error: $error}';
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