import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tulflix/constants.dart';

import 'components/components.dart';
import 'styles.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: {'text': tSettings, 'style': AppThemeData.appBarTitle},
        implyLeading: false,
        backgroundColor: AppThemeData.backgroundColor,
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
    return Container(
      padding: AppThemeData.pad16,
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height * 0.3,
          maxHeight: MediaQuery.of(context).size.height * 0.5
        ),
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, profile);
            },
            splashColor: AppThemeData.netflixRed.withAlpha(120),
            child: Center(
              child: Text('My Profile', style: AppThemeData.subtitle2),
            ),
          ),
        )
      ),
    );
  }
}