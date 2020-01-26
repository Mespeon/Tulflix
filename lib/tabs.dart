import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'styles.dart';

/// Route pages
import 'route/router.dart';
import 'pages.dart';

class TabsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Router.generateRoute,
      home: SafeArea(
        top: false,
        bottom: true,
        maintainBottomViewPadding: true,
        child: Dashboard()
      ),
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: AppThemeData.backgroundColor
      ),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    DashboardView(),
    SpecialsView(),
    CollectionsView(),
    SettingsView(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.08,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          elevation: 5,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppThemeData.backgroundColor,
          selectedFontSize: AppThemeData.dp8,
          selectedItemColor: AppThemeData.offWhite,
          selectedIconTheme: IconThemeData(color: AppThemeData.offWhite),
          unselectedIconTheme: IconThemeData(color: AppThemeData.offWhite.withAlpha(150)),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home, size: 20),
              title: new Text(tDashboard, style: AppThemeData.tabs),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.stars, size: 20),
              title: new Text(tSpecials, style: AppThemeData.tabs)
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.library_books, size: 20),
              title: new Text(tCollection, style: AppThemeData.tabs)
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.settings, size: 20),
              title: new Text(tSettings, style: AppThemeData.tabs)
            )
          ]
        )
      ),
      extendBody: true,
    );
  }
}