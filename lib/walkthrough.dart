import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tulflix/logic/logic.dart';
import 'constants.dart';
import 'styles.dart';

class WalkthroughPage extends StatelessWidget {
  final UserRepository userRepository;
  WalkthroughPage({Key key, @required this.userRepository}) : 
  assert(userRepository != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Walkthrough(userRepository: userRepository)
    // );

    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return WalkthroughBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository
          );
        },
        child: WalkthroughPager(),
      )
    );
  }
}

class WalkthroughPager extends StatefulWidget {
  @override
  WalkthroughPagerState createState() => WalkthroughPagerState();
}

class WalkthroughPagerState extends State<WalkthroughPager> {
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: <Widget>[
        WalkthroughPage1(),
        WalkthroughPage2(),
        WalkthroughPage3()
      ],
      onPageChanged: (page) {
        print('Walkthrough changed page: $page');
      },
      scrollDirection: Axis.horizontal,
    );
  }
}

class WalkthroughPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlutterLogo()
    );
  }
}

class WalkthroughPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
        maxWidth: MediaQuery.of(context).size.width
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            color: AppThemeData.translucentWhite
          ),
          Container(
            child: Text('A page called 2!', style: AppThemeData.subtitle2)
          )
        ],
      )
    );
  }
}

class WalkthroughPage3 extends StatefulWidget {
  @override
  WalkthroughPage3State createState() => WalkthroughPage3State();
}

class WalkthroughPage3State extends State<WalkthroughPage3> {
  bool _skipWalkthrough = false;

  @override
  Widget build(BuildContext context) {
    _onSkipWalkthroughChecked() {
      BlocProvider.of<WalkthroughBloc>(context).add(
        ShouldSkipWalkthrough(skipWalkthrough: _skipWalkthrough)
      );
    }

    return BlocListener<WalkthroughBloc, WalkthroughState>(
      listener: (context, state) {
        print(context);
        print(state);
      },
      child: BlocBuilder<WalkthroughBloc, WalkthroughState>(
        builder: (context, state) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppThemeData.translucentWhite,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(16))
                  )
                ),
                Expanded(
                  child: Container(
                    color: AppThemeData.backgroundColor
                  )
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text('Let\'s go!', style: AppThemeData.raisedButtonsRedText),
                        color: AppThemeData.netflixRed,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                        ),
                        elevation: 4,
                        onPressed: () {
                          BlocProvider.of<AuthenticationBloc>(context).add(ClearWalkthrough());
                        },
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Theme(
                            data: ThemeData(
                              unselectedWidgetColor: AppThemeData.offWhite,
                            ),
                            child: Checkbox(
                              value: _skipWalkthrough,
                              onChanged: (bool value) {
                                setState(() {
                                  _skipWalkthrough = value;
                                });
                                _onSkipWalkthroughChecked();
                              },
                              activeColor: AppThemeData.netflixRed,
                            ),
                          ),
                          Text('Skip walkthrough next time.', style: AppThemeData.footer)
                        ],
                      )
                    ],
                  )
                )
              ],
            )
          );
        },
      )
    );
  }
}

// class Walkthrough extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Expanded(child: Container()),
//           Text(walkthroughLine1, style: AppThemeData.splashTextWhite),
//           Text(walkthroughMainText, style: AppThemeData.splashTextRed),
//           Text(walkthroughLine2, style: AppThemeData.splashTextWhite),
//           Expanded(
//             flex: 1,
//             child: Container(
//               child: Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Padding(
//                   padding: EdgeInsets.only(top: 16),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       RaisedButton(
//                         color: AppThemeData.netflixRed,
//                         child: Text('Let\'s go, bruh!', style: AppThemeData.raisedButtonsRedText),
//                         onPressed: () {
//                           Navigator.pushReplacementNamed(context, login, arguments: {'userRepository': UserRepository});
//                         },
//                         elevation: 1.0,
//                       ),
//                       FlatButton(
//                         splashColor: AppThemeData.translucentWhite,
//                         child: Text('Register', style: AppThemeData.flatButtonsText),
//                         onPressed: () {},
//                       )
//                     ],
//                   ),
//                 )
//               )
//           )),
//         ],
//       )
//     );
//   }
// }