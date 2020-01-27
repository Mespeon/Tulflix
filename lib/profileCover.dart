import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'styles.dart';

/// Backdropped Profile
class ProfileCoverView extends StatelessWidget {
  final PageController pageController;
  ProfileCoverView({@required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(username: 'eromangasensei', appBar: AppBar()),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        top: false,
        bottom: true,
        maintainBottomViewPadding: true,
        child: Profile(
          pageController: pageController,
          firstName: 'Sagiri',
          lastName: 'Izumi',
          coverSrc: 'https://wallpapersmug.com/download/1440x2560/0ea484/eromanga-sensei-izumi-sagir-minimal.jpg',
          photoSrc: 'https://pm1.narvii.com/6527/3b91fda48d105ec9475a4a02e7c4d10ca29e058a_128.jpg'
        )
      ),
    );
  }
}

/// Creates a dynamic app bar so we could pass different parameters to the it.
enum useraction { connections, block, mute }
class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;  // Simply references an AppBar() widget.
  final String username;
  ProfileAppBar({@required this.username, @required this.appBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(username, style: AppThemeData.appBarTitleSm),
      centerTitle: true,
      actions: <Widget>[
        PopupMenuButton<useraction>(
          onSelected: (useraction result) {
            print(result);
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<useraction>> [
            const PopupMenuItem(
              value: useraction.connections,
              child: Text('Connections'),
            ),
            const PopupMenuItem(
              value: useraction.block,
              child: Text('Block')
            ),
            const PopupMenuItem(
              value: useraction.mute,
              child: Text('Mute')
            )
          ]
        )
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}

/// Creates a background container using the specified cover photo source.
/// Assigns a profile photo using the specified photo source.
class Profile extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String coverSrc;
  final String photoSrc;
  final PageController pageController;

  final List<String> thumbnails = [
    'images/sagiri.jpeg',
    'images/hattie_sagiri.jpg',
    'images/324560.jpg',
    'images/327002.jpg',
    'images/327158.jpg',
    'images/328925.jpg',
    'images/362254.jpg'
  ];

  Profile({
    @required this.pageController,
    @required this.firstName,
    @required this.lastName,
    @required this.coverSrc,
    @required this.photoSrc
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppThemeData.translucentWhite,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.clip,
        children: <Widget>[
          Hero(
            tag: 'coverphoto',
            transitionOnUserGestures: true,
            child: Container(
              child: ShaderMask(
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: coverSrc,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  fadeInDuration: Duration(milliseconds: 300),
                  fadeOutDuration: Duration(milliseconds: 300),
                ),
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [
                      Colors.grey[900].withAlpha(100)
                    ],
                    stops: [0.0]
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
              ),
            )
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.all(0),
                      padding: AppThemeData.hpad32,
                      child: Text(firstName, style: AppThemeData.heading2),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.all(0),
                      padding: AppThemeData.hpad32,
                      child: Text('Graphic Artist', style: AppThemeData.bodyText2),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: AppThemeData.vpad16,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: 90,
                              width: 60,
                              margin: AppThemeData.rpad8,
                              decoration: BoxDecoration(
                                color: AppThemeData.offWhite,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))
                              ),
                              child: Center(
                                child: Icon(Icons.stars, size: 30, color: Colors.redAccent,),
                              ),
                            ),
                          ),
                          Expanded(
                            // Photo Carousel
                            child: Container(
                              height: MediaQuery.of(context).size.width * 0.4,
                              child: new ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: thumbnails.length,
                                itemBuilder: (BuildContext context, int index) {
                                  print(thumbnails[index]); 
                                  return new AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration: Duration(milliseconds: 375),
                                    child: SlideAnimation(
                                      horizontalOffset: 100,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        margin: AppThemeData.hpad4,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: AppThemeData.translucentWhite,
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: AssetImage(thumbnails[index]),
                                            fit: BoxFit.cover,
                                            alignment: Alignment.center
                                          )
                                        ),
                                      )
                                    )
                                  );
                                }
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width
                    ),
                    child: 
                    Padding(
                      padding: AppThemeData.hpad8,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('204', style: AppThemeData.subtitle1),
                                Text('Following', style: AppThemeData.bodyText2)
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('302K', style: AppThemeData.subtitle1),
                                Text('Followers', style: AppThemeData.bodyText2)
                              ],
                            ),
                          ),
                          RaisedButton(
                            child: Text('Follow'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                            ),
                            onPressed: () {
                              print('Follow button tapped!');
                            },
                            elevation: 4,
                          ),
                          IconButton(
                            padding: EdgeInsets.all(0),
                            icon: Icon(Icons.arrow_forward, color: AppThemeData.offWhite,),
                            iconSize: 24,
                            onPressed: () {
                              print('View next pressed!');
                              pageController.animateToPage(1, curve: Curves.easeInOutQuint, duration: Duration(milliseconds: 500));
                            },
                          )
                        ],
                      )
                    )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}