import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tulflix/constants.dart';
import 'package:tulflix/styles.dart';

import 'constants.dart';
import 'styles.dart';

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
                    ),
                  )
                )
            )),
          ],
        )
      ),
    );
  }
}