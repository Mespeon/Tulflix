import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tulflix/constants.dart';
import 'package:tulflix/styles.dart';

// State management
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/logic.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository;
  LoginPage({
    Key key, @required this.userRepository
  }) : assert(userRepository != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository
          );
        },
        child: SafeArea(
          top: true,
          bottom: true,
          maintainBottomViewPadding: true,
          child: LoginForm(),
        ),
      )
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoginBtnDisabled;

  @override
  void initState() {
    super.initState();
    isLoginBtnDisabled = false;
  }

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text
        )
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red[700]
            )
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
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
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: AppThemeData.vpad8,
                        child: TextFormField(
                          controller: _usernameController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your email address.';
                            }
                            else {
                              return null;
                            }
                          },
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
                          controller: _passwordController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your password.';
                            }
                            else {
                              return null;
                            }
                          },
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
                              if (_formKey.currentState.validate()) {
                                if (state is! LoginLoading) {
                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Logging in. Please wait.'),
                                    )
                                  );
                                  _onLoginButtonPressed();
                                }
                              }
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
        },
      )
    );
  }
}