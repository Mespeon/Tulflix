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
      // appBar: CustomAppBar(
      //   appBar: AppBar(),
      //   title: {'text': '', 'style': AppThemeData.appBarTitle},
      //   backgroundColor: Colors.transparent,
      //   implyLeading: true,
      //   actions: [
      //     FlatButton.icon(
      //       icon: Icon(Icons.photo_library, color: AppThemeData.offWhite),
      //       label: Text('Posts'),
      //       textColor: AppThemeData.offWhite,
      //       onPressed: () {
      //         print('Posts button pressed!');
      //       },
      //     ),
      //     FlatButton.icon(
      //       icon: Icon(Icons.bookmark_border, color: AppThemeData.offWhite),
      //       label: Text('Favorites'),
      //       textColor: AppThemeData.offWhite,
      //       onPressed: () {
      //         print('Favorites button pressed!');
      //       },
      //     )
      //   ],
      // ),
      body: SafeArea(
        top: true,
        bottom: true,
        maintainBottomViewPadding: true,
        child: MainProfile(
          pageController: pageController,
          coverSrc: 'https://wallpapersmug.com/download/1440x2560/0ea484/eromanga-sensei-izumi-sagir-minimal.jpg'
        )
      ),
    );
  }
}

class MainProfile extends StatelessWidget {
  final PageController pageController;
  final String coverSrc;
  MainProfile({@required this.pageController, @required this.coverSrc});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: AppThemeData.backgroundColor,
          automaticallyImplyLeading: true,
          actions: <Widget>[
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
          pinned: false,
          floating: true,
        ),
        SliverToBoxAdapter(
          child: Container(
            /// THE WHOLE TOP SECTION OF THE GET STYLIN' PROFILE VIEW!!
            padding: AppThemeData.pad16,
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: MediaQuery.of(context).size.height / 2
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                /// This row will hold the profile photo, name, location, bio, and user points.
                /// Wow, such GET STYLIN'! <3 <3 <3
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Hero(
                      tag: 'coverphoto',
                      transitionOnUserGestures: true,
                      child: Container(
                        /// PROFILE PHOTO THUMBNAIL
                        constraints: BoxConstraints(
                          maxWidth: 100,
                          maxHeight: 140,
                        ),
                        decoration: BoxDecoration(
                          color: AppThemeData.translucentWhite,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: coverSrc,
                            fit: BoxFit.cover,
                            fadeInDuration: Duration(milliseconds: 300),
                            fadeOutDuration: Duration(milliseconds: 300),
                          ),
                        )
                      ),
                    ),
                    Container(
                      /// NAME, ABOUT, USER POINTS
                      constraints: BoxConstraints(
                        maxHeight: 140,
                      ),
                      padding: EdgeInsets.only(left: 16),
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            // NAME
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.5
                            ),
                            margin: AppThemeData.vpad4,
                            child: Text('Izumi Sagiri', style: AppThemeData.profileUserName),
                          ),
                          Container(
                            // BIO
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.5
                            ),
                            child: Text(
                              'I do make art, but you are definitely going to jail if you take a liking for me.',
                              style: AppThemeData.profileAbout,
                              overflow: TextOverflow.fade,
                              maxLines: 3,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: MediaQuery.of(context).size.width * 0.4,
                                  ),
                                  margin: EdgeInsets.only(right: 14),
                                  child: CustomIconText(item: [
                                    Icon(Icons.person_pin_circle, color: AppThemeData.offWhite, size: AppThemeData.dp18),
                                    Padding(
                                      padding: EdgeInsets.only(left: 2),
                                      child: Text('Tokyo, Japan', style: AppThemeData.bodyText3, overflow: TextOverflow.fade, maxLines: 1),
                                    )
                                  ])
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: MediaQuery.of(context).size.width * 0.4
                                  ),
                                  child: CustomIconText(item: [
                                    Icon(Icons.stars, color: AppThemeData.offWhite, size: AppThemeData.dp18),
                                    Padding(
                                      padding: EdgeInsets.only(left: 2),
                                      child: Text('9,000,322', style: AppThemeData.bodyText3, overflow: TextOverflow.fade, maxLines: 1),
                                    )
                                  ])
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ),
                  ],
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                    maxHeight: 50
                  ),
                  padding: AppThemeData.tpad8,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          child: RaisedButton(
                            child: Text('Follow'),
                            onPressed: () {},
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 2),
                        )
                      ),
                      Expanded(
                        child: Padding(
                          child: RaisedButton(
                            child: Text('Rewards'),
                            onPressed: () {},
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 2)
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          child: RaisedButton(
                            child: Text('More'),
                            onPressed: () {},
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 2),
                        ),
                      )
                    ],
                  )
                ),
              ],
            ),
          )
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 2
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: Duration(milliseconds: 300),
                columnCount: 50,
                child: SlideAnimation(
                  verticalOffset: 100,
                  child: FadeInAnimation(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.blueGrey[100 * (index % 9)],
                      child: Text('$index', style: AppThemeData.subtitle2),
                    )
                  ),
                ),
              );
            },
            childCount: 50
          ),
        ),
        SliverFillRemaining(
          fillOverscroll: true,
          hasScrollBody: true,
        )
      ],
    );
  }
}