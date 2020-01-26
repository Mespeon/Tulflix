import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 24,
            maxWidth: 24
          ),
          child: CircularProgressIndicator(
            strokeWidth: 4,
          ),
        )
      )
    );
  }
}