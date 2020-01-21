import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tulflix/constants.dart';
import 'package:tulflix/styles.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemeData.backgroundColor,
        brightness: Brightness.dark,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: AppThemeData.netflixRed),
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        maintainBottomViewPadding: true,
        child: LoginForm(),
        
      )
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
          child: Text(loginStr, style: AppThemeData.heading)
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
          child: Text(loginSubtitle, style: AppThemeData.subtitle3)
        ),
        Form(
          child: Column(
            children: <Widget>[
              Text('Form form stuff', style: AppThemeData.bodyText2)
            ],
          )
        ),
      ],
    );
  }
}