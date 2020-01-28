import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tulflix/logic/logic.dart';
import 'constants.dart';
import 'styles.dart';

class WalkthroughPage extends StatelessWidget {
  final UserRepository userRepository;
  WalkthroughPage({@required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Walkthrough(userRepository: userRepository)
    );
  }
}

class Walkthrough extends StatelessWidget {
  final UserRepository userRepository;
  Walkthrough({@required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Container()),
          Text(walkthroughLine1, style: AppThemeData.splashTextWhite),
          Text(walkthroughMainText, style: AppThemeData.splashTextRed),
          Text(walkthroughLine2, style: AppThemeData.splashTextWhite),
          Expanded(
            flex: 1,
            child: Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        color: AppThemeData.netflixRed,
                        child: Text('Let\'s go, bruh!', style: AppThemeData.raisedButtonsRedText),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, login, arguments: {'userRepository': UserRepository});
                        },
                        elevation: 1.0,
                      ),
                      FlatButton(
                        splashColor: AppThemeData.translucentWhite,
                        child: Text('Register', style: AppThemeData.flatButtonsText),
                        onPressed: () {},
                      )
                    ],
                  ),
                )
              )
          )),
        ],
      )
    );
  }
}