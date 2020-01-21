import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tulflix/constants.dart';

/* Navigation pages */
import 'package:tulflix/walkthrough.dart';
import 'package:tulflix/login.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case walkthrough:
        return MaterialPageRoute(builder: (_) => WalkthroughPage());

      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());

      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text('Page not existing'),
            automaticallyImplyLeading: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget> [
              Center(
                child: Text('Route not existing.')
              )
            ]
          ),
        ));
    }
  }
}