import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tulflix/constants.dart';
import 'package:tulflix/dashboard.dart';
import 'package:tulflix/styles.dart';
import 'package:tulflix/tabs.dart';

/* Navigation pages */
import 'package:tulflix/pages.dart';

// We added this so we could directly pass the UserRepository class
// to the login page from the Walkthrough page.
import 'package:tulflix/logic/logic.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      // case login:
      //   UserRepository userRepository = UserRepository();
      //   return MaterialPageRoute(builder: (_) => LoginPage(userRepository: userRepository));
      //   // return CupertinoPageRoute(builder: (_) => LoginPage(userRepository: userRepository));

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