import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tulflix/styles.dart';
import 'package:tulflix/constants.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(walkthroughMainText),
        backgroundColor: AppThemeData.backgroundColor,
        iconTheme: IconThemeData(color: AppThemeData.offWhite),
        textTheme: TextTheme(title: AppThemeData.appBarTitle),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.view_carousel),
            onPressed: () {
              Navigator.pushNamed(context, profile);
            },
          )
        ],
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        maintainBottomViewPadding: true,
        child: DashboardBody(),
      ),
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
        SliverToBoxAdapter(
          child: Container(
            padding: AppThemeData.padOvFlR8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Popular on Tulflix', style: AppThemeData.subtitle3),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: AppThemeData.bpad16,
                        height: 100,
                        child: new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return new SizedBox(
                              width: 200,
                              child: Card(child: Text('$index'), color: AppThemeData.translucentWhite),
                            );
                          },
                        )
                      )
                    )
                  ],
                ),
                Text('Trending Now', style: AppThemeData.subtitle3),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: AppThemeData.bpad16,
                        height: 100,
                        child: new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return new SizedBox(
                              width: 200,
                              child: Card(child: Text('$index'), color: AppThemeData.translucentWhite)
                            );
                          },
                        )
                      )
                    )
                  ],
                ),
                Text('Hall of Famers', style: AppThemeData.subtitle3),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: AppThemeData.bpad16,
                        height: 100,
                        child: new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return new SizedBox(
                              width: 200,
                              child: Card(child: Text('$index'), color: AppThemeData.translucentWhite)
                            );
                          },
                        )
                      )
                    )
                  ],
                ),
                Text('Latest on Tulflix', style: AppThemeData.subtitle3),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: AppThemeData.bpad16,
                        height: 100,
                        child: new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return new SizedBox(
                              width: 200,
                              child: Card(child: Text('$index'), color: AppThemeData.translucentWhite)
                            );
                          },
                        )
                      )
                    )
                  ],
                ),
              ],
            ),
          )
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: AppThemeData.hpad8,
            child: Text('Browse', style: AppThemeData.subtitle3),
          )
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                margin: AppThemeData.bpad8,
                padding: AppThemeData.hpad8,
                height: 200,
                child: Card(
                  color: AppThemeData.translucentWhite,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('$index', style: AppThemeData.heading),
                  )
                )
              );
            },
            childCount: 10
          ),
        ),
        // SliverFillRemaining(
        //   hasScrollBody: true,
        //   fillOverscroll: true,
        //   child: Container(),
        // )
      ],
    );
  }
}


// Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               Expanded(
//                 child: SizedBox(
//                   height: 100,
//                   child: new ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: 10,
//                     itemBuilder: (BuildContext context, int index) {
//                       return new Container(
//                         width: 100.0,
//                         child: Card(child: Text('$index', style: AppThemeData.subtitle3)),
//                       );
//                     },
//                   )
//                 ),
//               )
//             ],
//           )
        // Container(
        //   width: MediaQuery.of(context).size.width,
        //   child: Text('Popular', style: AppThemeData.subtitle1),
        //   padding: AppThemeData.hpad16
        // ),
        // Container(
        //   width: MediaQuery.of(context).size.width,
        //   child: Text('Latest', style: AppThemeData.subtitle1),
        //   padding: AppThemeData.hpad16
        // ),
        // Container(
        //   width: MediaQuery.of(context).size.width,
        //   child: Text('Hall of Famers', style: AppThemeData.subtitle1),
        //   padding: AppThemeData.hpad16
        // ),