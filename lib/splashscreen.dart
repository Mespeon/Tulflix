import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  final _splashHeader = GoogleFonts.bebasNeue(
    textStyle: TextStyle(color: Colors.red[700]),
    fontSize: 72
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('TULFLIX', style: _splashHeader),
            Container(
              color: Colors.grey[900],
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[700]),                  )
                )
              )
            ),
          ],
        )
      )
    );
  }
}