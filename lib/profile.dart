import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'styles.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: AppThemeData.backgroundColor,
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: ProfileSliverAppBar(expandedHeight: 200),
              pinned: true,
            ),
            SliverFillRemaining(
              hasScrollBody: true,
              fillOverscroll: true,
            )
          ]
        )
      )
    );
  }
}

class ProfileSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  ProfileSliverAppBar({@required this.expandedHeight});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: <Widget>[
        Opacity(
          opacity: (1 - shrinkOffset / expandedHeight),
          child: Container(
            color: AppThemeData.netflixRed,
          )
        ),
        Opacity(
          opacity: (0 + shrinkOffset / expandedHeight),
          child: Container(
            color: AppThemeData.backgroundColor
          )
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text('My Profile', style: AppThemeData.subtitle1),
          ),
        ),
        Positioned(
          top: (MediaQuery.of(context).size.height / 4) - (shrinkOffset * 1.4),
          left: 8,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Card(
              elevation: 5,
              child: SizedBox(
                height: 100,
                width: 100,
                child: FlutterLogo()
              ),
            ),
          )
        ),
        Positioned(
          top: expandedHeight,
          left: MediaQuery.of(context).size.width / 2,
          child: Text('Lunasa Prismriver', style: AppThemeData.bodyText1)
        )
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

class ProfileSliverList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Text('Some text', style: AppThemeData.bodyText1),
        Text('Some text', style: AppThemeData.bodyText1),
        Text('Some text', style: AppThemeData.bodyText1),
        Text('Some text', style: AppThemeData.bodyText1),
        Text('Some text', style: AppThemeData.bodyText1),
      ]),
    );
  }
}