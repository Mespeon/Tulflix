import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tulflix/constants.dart';
import 'package:tulflix/dashboard.dart';
import 'package:tulflix/styles.dart';
import 'package:tulflix/tabs.dart';

/* Navigation pages */
import 'package:tulflix/pages.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case walkthrough:
        return MaterialPageRoute(builder: (_) => WalkthroughPage());

      case login:
        var userRepository = settings.arguments;
        return MaterialPageRoute(builder: (_) => LoginPage(userRepository: userRepository));

      case tabs:
        return MaterialPageRoute(builder: (_) => Dashboard());
        
      case dashboard:
        return MaterialPageRoute(builder: (_) => DashboardView());

      case profile:
        return MaterialPageRoute(builder: (_) => ProfileView());

      case vSettings:
        return MaterialPageRoute(builder: (_) => SettingsView());

      case specials:
        return MaterialPageRoute(builder: (_) => SpecialsView());

      case collections:
        return MaterialPageRoute(builder: (_) => CollectionsView());      

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
                child: Text('Route not existing.', style: AppThemeData.subtitle2)
              )
            ]
          ),
        ));
    }
  }
}