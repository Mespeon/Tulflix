import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'components/components.dart';
import 'styles.dart';

class ProfileMainView extends StatelessWidget {
  final PageController pageController;
  ProfileMainView({@required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: {'text': '', 'style': AppThemeData.appBarTitle},
        backgroundColor: Colors.transparent,
        implyLeading: true,
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.photo_library, color: AppThemeData.offWhite),
            label: Text('Posts'),
            textColor: AppThemeData.offWhite,
            onPressed: () {
              print('Posts button pressed!');
            },
          ),
          FlatButton.icon(
            icon: Icon(Icons.bookmark_border, color: AppThemeData.offWhite),
            label: Text('Favorites'),
            textColor: AppThemeData.offWhite,
            onPressed: () {
              print('Favorites button pressed!');
            },
          )
        ],
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        maintainBottomViewPadding: true,
        child: MainProfile(pageController: pageController)
      ),
    );
  }
}

class MainProfile extends StatelessWidget {
  final PageController pageController;
  MainProfile({@required this.pageController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            padding: AppThemeData.pad16,
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: MediaQuery.of(context).size.height / 2
            ),
            color: AppThemeData.translucentWhite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /// This row will hold the profile photo, name, location, bio, and user points.
                /// Wow, such GET STYLIN'! <3 <3 <3
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 100,
                        maxHeight: 140,
                      ),
                      decoration: BoxDecoration(
                        color: AppThemeData.translucentWhite,
                        borderRadius: BorderRadius.circular(8)
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            fit: FlexFit.loose,
                            child: Container(
                              child: Text('Sagiri Izumi', style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w700,
                                fontSize: AppThemeData.dp24,
                                color: AppThemeData.offWhite
                              ))
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Container(
                              width: 200,
                              child: Text(
                                'I do not know anyone that goes by the name Eromanga-sensei!',
                                style: AppThemeData.bodyText3,
                                softWrap: true,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Container(
                              padding: EdgeInsets.only(top: 16),
                              width: 200,
                              child: Text(
                                'Tokyo, Japan',
                                style: AppThemeData.bodyText3,
                                softWrap: true,
                                overflow: TextOverflow.clip,
                              ),
                            )
                          ),
                        ],
                      )
                    )
                  ],
                )
              ],
            ),
          )
        )
      ],
    );
  }
}