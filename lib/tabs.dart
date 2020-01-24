import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'styles.dart';

/// Route pages
import 'dashboard.dart';
import 'settings.dart';

class TabsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        top: true,
        bottom: true,
        maintainBottomViewPadding: true,
        child: Dashboard()
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
          backgroundColor: AppThemeData.backgroundColor,
          unselectedFontSize: AppThemeData.dp8,
          unselectedItemColor: AppThemeData.translucentWhite,
          selectedFontSize: AppThemeData.dp8,
          selectedItemColor: AppThemeData.offWhite,
          selectedIconTheme: IconThemeData(color: AppThemeData.offWhite),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home, size: 20),
              title: new Text(tDashboard, style: AppThemeData.tabs),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.settings, size: 20),
              title: new Text(tProfile, style: AppThemeData.tabs)
            )
          ]
        )
      ),
      extendBody: true,
    );
  }
}