import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tulflix/styles.dart';
import 'package:tulflix/constants.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:tulflix/model/llsifModel.dart';
import 'package:tulflix/services/llsifService.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: true,
        maintainBottomViewPadding: true,
        child: DashboardBody()
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
    );
  }
}

class DashboardBody extends StatefulWidget {
  @override
  DashboardBodyState createState() => DashboardBodyState();
}

class DashboardBodyState extends State<DashboardBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppThemeData.backgroundColorTranslucent,
          title: Text(walkthroughMainText, style: AppThemeData.appBarTitle),
          elevation: 0,
          expandedHeight: MediaQuery.of(context).size.height * 0.88,
          floating: false,
          pinned: false,
          primary: true,
          flexibleSpace: new FlexibleSpaceBar(
            stretchModes: <StretchMode> [
              StretchMode.blurBackground,
            ],
            background: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  child: ShaderMask(
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: 'https://external-preview.redd.it/xLy3FqsplMGhvaWWHAiiXOIPEU84dwd-dQJJfkrcXZ8.png?width=960&crop=smart&format=pjpg&auto=webp&s=2385e5b5188bc188833a625dc4cdf6d459f8bbdd',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      fadeInDuration: Duration(milliseconds: 300),
                      fadeOutDuration: Duration(milliseconds: 300)
                    ),
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.grey[900].withAlpha(100),
                          Colors.grey[900].withAlpha(255)
                        ],
                        stops: [0.0, 0.9]
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.srcATop,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: AppThemeData.pad16,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: AppThemeData.vpad16,
                            child: Text('A Tulflix Original Series', style: AppThemeData.umbrella)
                          ),
                          Text('Stop, Look, Listen, and Learn.', style: AppThemeData.title, maxLines: 3, textScaleFactor: 1, overflow: TextOverflow.fade),
                          Padding(
                            padding: AppThemeData.vpad8,
                            child: 
                            Text('Discover how a common person experienced one of life\'s hardest lessons. An emotional rollercoaster ride.',
                            style: AppThemeData.bodyText3, maxLines: 3, textScaleFactor: 1, overflow: TextOverflow.fade)
                          ),
                          Padding(
                            padding: AppThemeData.vpad24,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                RaisedButton(
                                  color: AppThemeData.netflixRed,
                                  splashColor: AppThemeData.translucentWhite,
                                  child: Text('WATCH NOW', style: AppThemeData.raisedButtonsRedText),
                                  onPressed: () {},
                                ),
                                FlatButton.icon(
                                  icon: Icon(Icons.thumb_up, color: AppThemeData.offWhite, size: 18),
                                  label: Text('Add to Watch List', style: AppThemeData.raisedButtonsRedText),
                                  splashColor: AppThemeData.translucentWhite,
                                  onPressed: () {},
                                )
                              ],
                            )
                          )

                        ],
                      )
                    ),
                  ),
                )
              ],
            ),
            collapseMode: CollapseMode.parallax,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('My Profile', style: AppThemeData.appBarFlatButtons),
              textColor: AppThemeData.offWhite,
              onPressed: () {
                Navigator.pushNamed(context, profile);
              },
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            )
          ],
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: AppThemeData.padOvFlR8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SectionCreator(rowTitle: 'Popular on Tulflix'),
                RowCreator(
                  thumbItems: [
                    '0','1','2','3','4','5'
                  ],
                ),
                SectionCreator(rowTitle: 'Trending Now'),
                RowCreator(
                  thumbItems: [
                    '0','1','2','3','4','5','0','1','2','3','4','5'
                  ]
                ),
                SectionCreator(rowTitle: 'Hall of Famers'),
                RowCreator(
                  thumbItems: [
                    '0', '1'
                  ],
                ),
                SectionCreator(rowTitle: 'Latest on Tulflix'),
                RowCreator(
                  thumbItems: [
                    '0','1','2'
                  ],
                )
              ],
            ),
          )
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: AppThemeData.hpad8,
            child: SectionCreator(rowTitle: 'Browse the world of Tulflix'),
          )
        ),
        Browse(),
        // SliverFillRemaining(
        //   hasScrollBody: true,
        //   fillOverscroll: true,
        //   child: Container(),
        // )
      ],
    );
  }
}

class SectionCreator extends StatelessWidget {
  final String rowTitle;
  SectionCreator({this.rowTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppThemeData.vpad16,
      child: Text(rowTitle, style: AppThemeData.subtitle3)
    );
  }
}

class RowCreator extends StatelessWidget {
  final List<dynamic> thumbItems;
  RowCreator({@required this.thumbItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: AppThemeData.bpad16,
            height: MediaQuery.of(context).size.height * 0.2,
            child: new ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: thumbItems.length,
              itemBuilder: (BuildContext context, int index) {
                return new AnimationConfiguration.staggeredList(
                  position: index,
                  duration: Duration(milliseconds: 375),
                  child: SlideAnimation(
                    horizontalOffset: 140,
                    child: FadeInAnimation(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Card(
                          child: Text('$index'), 
                          color: AppThemeData.translucentWhite,
                          elevation: 5
                        ),
                      ),
                    ),
                  )
                );
              },
            )
          )
        )
      ],
    );
  }
}

class Browse extends StatefulWidget {
  @override
  BrowseListState createState() => BrowseListState();
}

/// Classes needed for the async request in FutureBuilder
// class BrowseListData {
//   // Prepares 
//   Future<Stargazer> members;
//   BrowseListData({this.members});
// }

Future<Stargazer> _getAllData() async {
  return await getMembers();
}

class BrowseListState extends State<Browse> {
  List<Widget> members = List<Widget>();
  Future<Stargazer> _stargazerData;

  @override
  void initState() {
    super.initState();

    print('initState');
    if (members.length == 0) {
      print('Getting all data.');
      _stargazerData = _getAllData();
    }
  }

  insertEntry(data, index, group) {
    // FadeInImage.memoryNetwork(
    //                   placeholder: kTransparentImage,
    //                   image: 'https://external-preview.redd.it/xLy3FqsplMGhvaWWHAiiXOIPEU84dwd-dQJJfkrcXZ8.png?width=960&crop=smart&format=pjpg&auto=webp&s=2385e5b5188bc188833a625dc4cdf6d459f8bbdd',
    //                   fit: BoxFit.cover,
    //                   alignment: Alignment.center,
    //                   fadeInDuration: Duration(milliseconds: 300),
    //                   fadeOutDuration: Duration(milliseconds: 300)
    //                 )
    String imgSrc;
    if (data['cardPhoto'] == 'https://raw.githubusercontent.com/Mespeon/Sibyl-S2-Backend/master/psychopass/resources/') {
      imgSrc = 'https://firebasestorage.googleapis.com/v0/b/otonokizaka-3a6d9.appspot.com/o/default.jpg?alt=media&token=b8736d57-e915-41f4-8f68-9ace1496c45e';
    }
    else {
      imgSrc = data['cardPhoto'];
    }

    return Card(
      color: AppThemeData.translucentWhite,
      child: Container(
        alignment: Alignment.center,
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: imgSrc,
          fit: BoxFit.cover,
          alignment: Alignment.center,
          fadeInDuration: Duration(milliseconds: 300),
          fadeOutDuration: Duration(milliseconds: 300),
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Stargazer>(
      future: _stargazerData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          print('=========== Retrieved Future data! ===========');
          // print(snapshot.data.data.toJson());
          var muses = snapshot.data.data.muse;
          var aqours = snapshot.data.data.aqours;

          var museMap = muses.asMap();
          var aqoursMap = aqours.asMap();

          // Add Muses
          museMap.forEach((i, element) {
            var data = element.toJson();
            members.add(insertEntry(data, i, 'muse'));
          });

          aqoursMap.forEach((i, element) {
            var data = element.toJson();
            members.add(insertEntry(data, i, 'aqours'));
          });

          if (members.length == 0) {
            print('No data retrieved.');
          }
          else {
            print('List returned!');
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    duration: Duration(milliseconds: 300),
                    position: index,
                    child: SlideAnimation(
                      verticalOffset: 100,
                      child: FadeInAnimation(
                        child: Container(
                          margin: AppThemeData.bpad8,
                          padding: AppThemeData.bpad8,
                          height: 200,
                          child: members.length > 0 ? members[index]
                          : Card(
                            color: AppThemeData.translucentWhite,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text('No data found.', style: AppThemeData.heading)
                            ),
                          )
                        ),
                      )
                    )
                  );
                },
                childCount: members.length <= 0 ? 1 : members.length
              )
            );
          }
        }
        // return snapshot.hasData ? SliverList(
        //   delegate: SliverChildBuilderDelegate(
        //     (BuildContext context, int index) {
        //       return AnimationConfiguration.staggeredList(
        //         duration: Duration(milliseconds: 300),
        //         position: index,
        //         child: SlideAnimation(
        //           verticalOffset: 250,
        //           child: FadeInAnimation(
        //             child: Container(
        //               margin: AppThemeData.bpad8,
        //               padding: AppThemeData.bpad8,
        //               height: 200,
        //               child: members.length > 0 ? members[index]
        //               : Card(
        //                 color: AppThemeData.translucentWhite,
        //                 child: Container(
        //                   alignment: Alignment.center,
        //                   child: Text('No data found.', style: AppThemeData.heading)
        //                 ),
        //               )
        //             ),
        //           )
        //         )
        //       );
        //     },
        //     childCount: members.length <= 0 ? 1 : members.length
        //   )
        // )
        // : 
        // SliverToBoxAdapter(
        //   child: Center(
        //     child: CircularProgressIndicator()
        //   )
        // );
      }
    );
  }

  // pullData() {
  //   print('Pulling Future.');
  //   new FutureBuilder<DataNeeded>(
  //     future: _dataNeeded,
  //     builder: (BuildContext context, AsyncSnapshot data) {
  //       if (data.hasData) {
  //         print('=========== Retrieved Future data! ===========');
  //         print(data);
  //         var muses = data.data.data.muse;
  //         var aqours = data.data.data.aqours;

  //         var museMap = muses.asMap();
  //         var aqoursMap = aqours.asMap();

  //         // Add Muses
  //         museMap.forEach((i, element) {
  //           var data = element.toJson();
  //           members.add(insertEntry(data, i, 'muse'));
  //         });

  //         aqoursMap.forEach((i, element) {
  //           var data = element.toJson();
  //           members.add(insertEntry(data, i, 'aqours'));
  //         });

  //         if (members.length == 0) {
  //           print('No data retrieved.');
  //         }
  //       }
  //       else if (data.hasError) {
  //         print('Error on Future pull.');
  //       }
  //       else {
  //         print('No data pulled from Future.');
  //       }
  //       return CircularProgressIndicator();
  //     }
  //   );

  //   print('Members');
  //   print(members);
  // }
}

// class Browse extends StatelessWidget {
//   final List<dynamic> items;
//   Browse({@required this.items});
  
//   @override
//   Widget build(BuildContext context) {
//     return SliverList(
//       delegate: SliverChildBuilderDelegate(
//         (BuildContext context, int index) {
//           return AnimationConfiguration.staggeredList(
//             child: SlideAnimation(
//               verticalOffset: 250,
//               child: FadeInAnimation(
//                 child: Container(
//                   margin: AppThemeData.bpad8,
//                   padding: AppThemeData.hpad8,
//                   height: 200,
//                   child: Card(
//                     color: AppThemeData.translucentWhite,
//                     child: Container(
//                       alignment: Alignment.center,
//                       child: Text('$index', style: AppThemeData.heading),
//                     )
//                   )
//                 )
//               )
//             ),
//             duration: Duration(milliseconds: 375),
//             position: index,
//           );
//         },
//         childCount: items.length
//       ),
//     );
//   }
// }