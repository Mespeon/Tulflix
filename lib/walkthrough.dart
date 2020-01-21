import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tulflix/constants.dart';
import 'package:tulflix/styles.dart';

class WalkthroughPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container()
            ),
            Center(child: Text(walkthroughLine1, style: AppThemeData.splashTextWhite)),
            Center(child: Text(walkthroughMainText, style: AppThemeData.splashTextRed)),
            Center(child: Text(walkthroughLine2, style: AppThemeData.splashTextWhite)),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(flex: 8, child: Container()),
                    RaisedButton(
                      color: AppThemeData.netflixRed,
                      child: Text('Let\'s go, bruh!', style: AppThemeData.raisedButtonsText),
                      onPressed: () {
                        Navigator.pushNamed(context, login);
                      },
                      elevation: 1.0,
                    ),
                    FlatButton(
                      splashColor: AppThemeData.translucentWhite,
                      child: Text('Register', style: AppThemeData.flatButtonsText),
                      onPressed: () {},
                    )
                  ],
                )
              )
            )
          ],
        )
      ),
    );
  }
}