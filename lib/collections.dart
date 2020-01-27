import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'components/components.dart';
import 'styles.dart';
import 'constants.dart';

class CollectionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: {'text': tCollection, 'style': AppThemeData.appBarTitle},
        implyLeading: false,
        backgroundColor: AppThemeData.backgroundColor,
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        maintainBottomViewPadding: true,
        child: Collections(),
      ),
    );
  }
}

class Collections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width
      ),
      child: Container(
        padding: AppThemeData.pad8,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.collections, color: AppThemeData.offWhite),
              Text('Oh wow, collections!', style: AppThemeData.bodyText1, maxLines: 2, overflow: TextOverflow.fade),
            ],
          )
        ),
      ),
    );
  }
}