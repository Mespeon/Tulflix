import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tulflix/styles.dart';

/*
  ALERTS, DIALOG BOXES, AND LOADING INDICATORS
*/
class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
    child: CircularProgressIndicator()
  );
}

Future<void> showAlertDialog(context, dialog) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return dialog;
    }
  );
}

class CustomMaterialAlertDialog extends StatelessWidget {
  final String title;
  final Object content;
  final List<Object> actions;
  final double elevation;
  final Color backgroundColor;

  CustomMaterialAlertDialog({
    @required this.title,
    @required this.content,
    @required this.actions,
    this.elevation, this.backgroundColor
  });

  _insertAction() {
    var actionMap = actions.asMap();
    actionMap.map((action, index) {
      return actions[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('$title'),
      content: content,
      actions: <Widget>[
        _insertAction()
      ],
      elevation: elevation != null ? elevation : 1,
      backgroundColor: backgroundColor != null ? backgroundColor : AppThemeData.offWhite,
    );
  }
}

class CustomCupertinoAlertDialog extends StatelessWidget {
  final String title;
  final Object content;
  final List<Object> actions;
  CustomCupertinoAlertDialog({
    @required this.title,
    @required this.content,
    @required this.actions
  });

  _insertAction() {
    var actionMap = actions.asMap();
    actionMap.map((action, index) {
      return actions[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('$title'),
      content: content,
      actions: <Widget>[
        _insertAction()
      ],
    );
  }
}

/*
  SCAFFOLD WIDGETS
*/
/// Creates a dynamic app bar so we could pass different parameters to the it.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;  // Reference the app bar widget passed to the class.
  final Map<dynamic, dynamic> title;
  final List<Widget> actions;
  final bool implyLeading;
  final Color backgroundColor;
  CustomAppBar({@required this.appBar, this.title, this.actions, this.implyLeading, this.backgroundColor});
  /*
    TO DO
    Determine which parts of the app bar needs to be dynamic so we could include
    it in the initialization and method calls.
  */

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      automaticallyImplyLeading: implyLeading,
      title: Text('${title['text']}', style: title['style'],),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}

/*
  BODY WIDGETS
*/
/// Creates a text List based on the given number of items.
class CustomTextList extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  CustomTextList({@required this.items});

  Widget createList(items) {

  }

  Widget build(BuildContext context) {
    return createList(items);
  }
}

/// Creates a button List based on the given number of items.
/// Item keys should also be given a value for the onPressed attribute.
class CustomButtonList extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  CustomButtonList({@required this.items});

  Widget createList(items) {

  }

  Widget build(BuildContext context) {
    return createList(items);
  }
}

/// Creates a single Row item for use in a ListView.
/// Useful for generating a button with complex onPressed code.
class CustomListItem extends StatelessWidget {
  final Map<String, dynamic> item;
  CustomListItem({@required this.item});

  Widget createItem(item) {

  }

  Widget build(BuildContext context) {
    return createItem(item);
  }
}

/// Creates an inline icon with text Widget
class CustomIconText extends StatelessWidget {
  final List<Widget> item;
  CustomIconText({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: item
    );
  }
}

/// Creates a ListTile Widget
/// Useful for placing in ListViews as tappable buttons.
class CustomListTile extends StatelessWidget {
  final Widget title;
  final Widget subtitle;
  final Function onTap;
  final Icon leading;
  final Icon trailing;
  CustomListTile({
    @required this.title,
    this.subtitle,
    @required this.onTap,
    this.leading,
    this.trailing
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      subtitle: subtitle,
      leading: leading != null ? leading : Icon(Icons.info_outline),
      trailing: trailing != null ? trailing : null,
      onTap: onTap,
      dense: true
    );
  }
}

/// Creates a Column widget
/// Useful for generating simple single-column widgets
class CustomColumnarItem extends StatelessWidget {
  final Map<String, dynamic> item;
  CustomColumnarItem({@required this.item});

  _createItem(item) {
    var columnarItem;
    item.map((item, index) {
      columnarItem = Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          item[index]
        ],
      );
    });

    return columnarItem;
  }

  @override
  Widget build(BuildContext context) {
    return _createItem(item);
  }
}