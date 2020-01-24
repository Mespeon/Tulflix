import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'components/appbar.dart';
import 'styles.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar()
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        maintainBottomViewPadding: true,
        child: Settings()
      )
    );
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('HELLO WORLD');
  }
}