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
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(loginStr, style: AppThemeData.heading),
          Text(loginSubtitle, style: AppThemeData.subtitle3),
          Form(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: AppThemeData.vpad8,
                  child: TextFormField(
                    autovalidate: false,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: AppThemeData.inputFieldPlaceholder,
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppThemeData.gray)),
                    ),
                    style: AppThemeData.inputFieldText
                  ),
                ),
                Padding(
                  padding: AppThemeData.vpad8,
                  child: TextFormField(
                    autovalidate: false,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: AppThemeData.inputFieldPlaceholder,
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppThemeData.gray))
                    ),
                    style: AppThemeData.inputFieldText,
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: AppThemeData.tpad16,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: RaisedButton(
                      autofocus: false,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, tabs);
                      },
                      color: AppThemeData.netflixRed,
                      child: Text(loginStr, style: AppThemeData.raisedButtonsRedText),
                      padding: EdgeInsets.all(0),
                    )
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    autofocus: false,
                    onPressed: () {},
                    child: Text('Forgot Password', style: AppThemeData.flatButtonsText),
                    padding: EdgeInsets.all(0),
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}