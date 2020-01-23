import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tulflix/styles.dart';
import 'package:tulflix/constants.dart';

/// Creates a dynamic app bar so we could pass different parameters to the it.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;  // Reference the app bar widget passed to the class.
  CustomAppBar({@required this.appBar});
  /*
    TO DO
    Determine which parts of the app bar needs to be dynamic so we could include
    it in the initialization and method calls.
  */

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey[500],
      elevation: 2,
      title: Text('App Bar'),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}