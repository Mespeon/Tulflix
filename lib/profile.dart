import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'styles.dart';

/// Backdropped Profile
class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(username: 'eromangasensei', appBar: AppBar()),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Profile(
        firstName: 'Sagiri',
        lastName: 'Izumi',
        coverSrc: 'https://wallpapersmug.com/download/1440x2560/0ea484/eromanga-sensei-izumi-sagir-minimal.jpg',
        photoSrc: 'https://pm1.narvii.com/6527/3b91fda48d105ec9475a4a02e7c4d10ca29e058a_128.jpg'
      ),
    );
  }
}

/// Creates a dynamic app bar so we could pass different parameters to the it.
class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;  // Simply references an AppBar() widget.
  final String username;
  ProfileAppBar({@required this.username, @required this.appBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(username, style: AppThemeData.appBarTitleSm),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
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

  Profile({@required this.firstName, @required this.lastName, @required this.coverSrc, @required this.photoSrc});

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
          Container(
            child: ShaderMask(
              child: Image.network(coverSrc, fit: BoxFit.cover),
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
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 120,
                              child: new ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return new Container(
                                    width: 120,
                                    margin: AppThemeData.hpad4,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppThemeData.translucentWhite,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Text('$index'),
                                  );
                                }
                              ),
                            ),
                          )
                        ],
                      ),
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

/// FB-ish profile
// class ProfileView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: true,
//       bottom: true,
//       maintainBottomViewPadding: true,
//       child: CustomScrollView(
//         slivers: <Widget>[
//           ProfileCover(
//             coverSrc: 'https://en.touhouwiki.net/images/f/ff/BAiJRLunasa1.JPG',
//             profSrc: 'https://www.anime-planet.com/images/characters/lunasa-prismriver-34059.jpg?t=1514637740'
//           ),
//           SliverFillRemaining(
//             hasScrollBody: true,
//             fillOverscroll: true,
//             child: Container(
//               height: 200,
//             ),
//           )
//         ],
//       )
//     );
//   }
// }

// /// Profile Cover Photo and Profile Photo
// class ProfileCover extends StatelessWidget {
//   final String coverSrc;
//   final String profSrc;
//   ProfileCover({@required this.coverSrc, @required this.profSrc});

//   @override
//   Widget build(BuildContext context) {
//     print(coverSrc);
//     return SliverToBoxAdapter(
//       child: Container(
//         padding: AppThemeData.pad8,
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height / 3,
//         child: Stack(
//           fit: StackFit.expand,
//           overflow: Overflow.visible,
//           children: <Widget>[
//             Container(
//               decoration: BoxDecoration(
//                 color: AppThemeData.translucentWhite,
//                 borderRadius: BorderRadius.circular(14),
//                 image: DecorationImage(
//                   image: NetworkImage(coverSrc),
//                   fit: BoxFit.cover
//                 )
//               ),
//             ),
//             Positioned(
//               top: MediaQuery.of(context).size.height / 5.5,
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Container(
//                       width: 140,
//                       height: 140,
//                       decoration: BoxDecoration(
//                         color: AppThemeData.backgroundColor,
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image: NetworkImage(profSrc),
//                           fit: BoxFit.cover,
//                           alignment: Alignment.center,
//                         ),
//                         border: Border.all(
//                           color: AppThemeData.offWhite,
//                           width: 10,
//                         ),
//                         boxShadow: [
//                           new BoxShadow(
//                             color: AppThemeData.backgroundColor,
//                             offset: Offset(0, 0),
//                             blurRadius: 8
//                           )
//                         ]
//                       ),
//                     )
//                   ],
//                 )
//               )
//             )
//           ],
//         ),
//       )
//     );
//   }
// }

/// Sliver-based profile
// class ProfileView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Material(
//         color: AppThemeData.backgroundColor,
//         child: CustomScrollView(
//           slivers: [
//             SliverPersistentHeader(
//               delegate: ProfileSliverAppBar(expandedHeight: 200),
//               pinned: true,
//             ),
//             SliverFillRemaining(
//               hasScrollBody: true,
//               fillOverscroll: true,
//             )
//           ]
//         )
//       )
//     );
//   }
// }

// class ProfileSliverAppBar extends SliverPersistentHeaderDelegate {
//   final double expandedHeight;
//   ProfileSliverAppBar({@required this.expandedHeight});

//   @override
//   Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Stack(
//       fit: StackFit.expand,
//       overflow: Overflow.visible,
//       children: <Widget>[
//         Opacity(
//           opacity: (1 - shrinkOffset / expandedHeight),
//           child: Container(
//             color: AppThemeData.netflixRed,
//           )
//         ),
//         Opacity(
//           opacity: (0 + shrinkOffset / expandedHeight),
//           child: Container(
//             color: AppThemeData.backgroundColor
//           )
//         ),
//         Center(
//           child: Opacity(
//             opacity: shrinkOffset / expandedHeight,
//             child: Text('My Profile', style: AppThemeData.subtitle1),
//           ),
//         ),
//         Positioned(
//           top: (MediaQuery.of(context).size.height / 4) - (shrinkOffset * 1.4),
//           left: 8,
//           child: Opacity(
//             opacity: (1 - shrinkOffset / expandedHeight),
//             child: Card(
//               elevation: 5,
//               child: SizedBox(
//                 height: 100,
//                 width: 100,
//                 child: FlutterLogo()
//               ),
//             ),
//           )
//         ),
//         Positioned(
//           top: expandedHeight,
//           left: MediaQuery.of(context).size.width / 2.5,
//           child: Text('Lunasa Prismriver', style: AppThemeData.bodyText1)
//         )
//       ],
//     );
//   }

//   @override
//   double get maxExtent => expandedHeight;

//   @override
//   double get minExtent => kToolbarHeight;

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
// }

// class ProfileSliverList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SliverList(
//       delegate: SliverChildListDelegate([
//         Text('Some text', style: AppThemeData.bodyText1),
//         Text('Some text', style: AppThemeData.bodyText1),
//         Text('Some text', style: AppThemeData.bodyText1),
//         Text('Some text', style: AppThemeData.bodyText1),
//         Text('Some text', style: AppThemeData.bodyText1),
//       ]),
//     );
//   }
// }