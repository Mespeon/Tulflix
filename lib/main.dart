// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Routing
import 'package:tulflix/route/router.dart';

// State management
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/logic.dart';

// Pages and components
import 'components/components.dart';
import 'tabs.dart';
import 'login.dart';
import 'splash.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}
void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)..add(AppStarted());
      },
      child: MyApp(userRepository: userRepository),
    )
  );
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  MyApp({Key key, @required this.userRepository}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      ),
      child: MaterialApp(
        onGenerateRoute: Router.generateRoute,
        title: 'Tulflix',
        theme: ThemeData(
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: Color.fromRGBO(33, 33, 33, 1)
        ),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            Object view;

            // Show the splash screen if the BLoC is initializing.
            if (state is AuthenticationUninitialized) {
              view = SplashPage();
            }

            // Show the dashboard if the user is logged in/authenticated.
            if (state is AuthenticationAuthenticated) {
              view = TabsView();
            }

            // Show the login view if the user is logged out/unauthenticated.
            if (state is AuthenticationUnauthenticated) {
              view = LoginPage(userRepository: userRepository);
            }

            // Show a loading indicator while the BLoC is loading/running.
            if (state is AuthenticationLoading) {
              view = LoadingIndicator();
            }

            return view;
          },
        )
      )
    );
  }
}