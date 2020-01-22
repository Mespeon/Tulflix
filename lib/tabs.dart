import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'styles.dart';

/// Route pages
import 'dashboard.dart';
import 'profile.dart';

class TabsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        top: true,
        bottom: true,
        maintainBottomViewPadding: true,
        child: Dashboard()
      )
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
    ProfileView(),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.grey[900],
        unselectedFontSize: AppThemeData.dp8,
        unselectedItemColor: AppThemeData.translucentWhite,
        selectedFontSize: AppThemeData.dp8,
        selectedItemColor: AppThemeData.offWhite,
        selectedIconTheme: IconThemeData(color: AppThemeData.offWhite),
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home, size: 20),
            title: new Text(tDashboard, style: AppThemeData.tabs),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person, size: 20),
            title: new Text(tProfile, style: AppThemeData.tabs)
          )
        ]
      ),
    );
  }
}