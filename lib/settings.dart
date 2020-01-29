// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tulflix/constants.dart';
import 'package:transparent_image/transparent_image.dart';
import 'components/components.dart';
import 'constants.dart';
import 'styles.dart';

// State management
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tulflix/logic/logic.dart';

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
        child: Settings(
          coverSrc: 'https://wallpapersmug.com/download/1440x2560/0ea484/eromanga-sensei-izumi-sagir-minimal.jpg'
        )
      )
    );
  }
}

class Settings extends StatelessWidget {
  final String coverSrc;
  Settings({@required this.coverSrc});

  @override
  Widget build(BuildContext context) {
    Future<void> _logoutPrompt() async {
      return showDialog<void>(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Log Out'),
            content: Text('Are you sure you want to log out?'),
            actions: <Widget>[
              FlatButton(
                child: Text('Yes'),
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                },
              ),
              FlatButton(
                child: Text('No'),
                onPressed: () {
                  print('Do not logout.');
                },
              )
            ],
          );
        }   
      );
    }

    return ListView(
      scrollDirection: Axis.vertical,
      cacheExtent: 100,
      children: <Widget>[
        Container(
          padding: AppThemeData.pad8,
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.2,
              maxHeight: MediaQuery.of(context).size.height * 0.3,
              minWidth: MediaQuery.of(context).size.width
            ),
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, profile);
                },
                splashColor: AppThemeData.netflixRed.withAlpha(120),
                child: Stack(
                  fit: StackFit.expand,
                  overflow: Overflow.clip,
                  children: <Widget>[
                    /// STACKING IS ARRANGED AS:
                    /// [0] BOTTOM ... [n] TOP
                    Hero(
                      tag: 'coverphoto',
                      transitionOnUserGestures: true,
                      child: Container(
                        foregroundDecoration: BoxDecoration(
                          color: AppThemeData.backgroundColor.withAlpha(100)
                        ),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: coverSrc,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          fadeInDuration: Duration(milliseconds: 300),
                          fadeOutDuration: Duration(milliseconds: 300),
                        ), 
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 7,
                      child: Text('My Profile', style: AppThemeData.subtitle1),
                    ),
                  ],
                )
              ),
            )
          ),
        ),
        Divider(
          color: AppThemeData.translucentWhite
        ),
        LimitedBox(
          maxHeight: 100,
          child: Padding(
            padding: AppThemeData.hpad8,
            child: Card(
              color: AppThemeData.bluegreyBackground,
              child: CustomListTile(
                title: Text(sProfile, style: AppThemeData.listTileTitle),
                subtitle: Text(sProfileSub, style: AppThemeData.bodyText3),
                leading: Icon(Icons.account_circle, color: AppThemeData.offWhite),
                trailing: Icon(Icons.arrow_forward, color: AppThemeData.offWhite),
                onTap: () { print('Profile is tapped!'); },
              )
            ),
          )
        ),
        LimitedBox(
          maxHeight: 100,
          child: Padding(
            padding: AppThemeData.hpad8,
            child: Card(
              color: AppThemeData.bluegreyBackground,
              child: CustomListTile(
                title: Text(sNotifications, style: AppThemeData.listTileTitle),
                subtitle: Text(sNotificationSub, style: AppThemeData.bodyText3),
                leading: Icon(Icons.notifications, color: AppThemeData.offWhite),
                trailing: Icon(Icons.arrow_forward, color: AppThemeData.offWhite),
                onTap: () { print('Profile is tapped!'); },
              )
            ),
          )
        ),
        LimitedBox(
          maxHeight: 100,
          child: Padding(
            padding: AppThemeData.hpad8,
            child: Card(
              color: AppThemeData.bluegreyBackground,
              child: CustomListTile(
                title: Text(sPrivacy, style: AppThemeData.listTileTitle),
                subtitle: Text(sPrivacySub, style: AppThemeData.bodyText3),
                leading: Icon(Icons.lock_outline, color: AppThemeData.offWhite),
                trailing: Icon(Icons.arrow_forward, color: AppThemeData.offWhite),
                onTap: () { print('Privacy is tapped!'); },
              )
            ),
          )
        ),
        LimitedBox(
          maxHeight: 100,
          child: Padding(
            padding: AppThemeData.hpad8,
            child: Card(
              color: AppThemeData.bluegreyBackground,
              child: CustomListTile(
                title: Text(sSecurity, style: AppThemeData.listTileTitle),
                subtitle: Text(sSecuritySub, style: AppThemeData.bodyText3),
                leading: Icon(Icons.security, color: AppThemeData.offWhite),
                trailing: Icon(Icons.arrow_forward, color: AppThemeData.offWhite),
                onTap: () { print('Security is tapped!'); },
              )
            ),
          )
        ),
        LimitedBox(
          maxHeight: 100,
          child: Padding(
            padding: AppThemeData.hpad8,
            child: Card(
              color: AppThemeData.bluegreyBackground,
              child: CustomListTile(
                title: Text(sAbout, style: AppThemeData.listTileTitle),
                subtitle: Text(sAboutSub, style: AppThemeData.bodyText3),
                leading: Icon(Icons.info_outline, color: AppThemeData.offWhite),
                trailing: Icon(Icons.arrow_forward, color: AppThemeData.offWhite),
                onTap: () { print('About is tapped!'); },
              )
            ),
          )
        ),
        LimitedBox(
          maxHeight: 100,
          child: Padding(
            padding: AppThemeData.hpad8,
            child: Card(
              color: AppThemeData.bluegreyBackground,
              child: CustomListTile(
                title: Text('Log Out', style: AppThemeData.listTileTitle),
                subtitle: Text('Log out of Tulflix.', style: AppThemeData.bodyText3),
                leading: Icon(Icons.exit_to_app, color: AppThemeData.offWhite),
                trailing: Icon(Icons.arrow_forward, color: AppThemeData.offWhite),
                onTap: () {
                  // BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                  _logoutPrompt();
                },
              )
            ),
          )
        ),
      ],
    );
  }
}