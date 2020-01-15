import 'package:flutter/material.dart';
import 'package:helloweb/screens/contact/contact_screen.dart';
import 'package:helloweb/screens/features/features_screen.dart';
import 'package:helloweb/screens/home/home_screen.dart';
import 'package:helloweb/screens/products/products_screen.dart';
import 'package:helloweb/style/theme_base.dart';
import 'package:helloweb/utils/screen_utils.dart';

import 'widgets/drawer_layout/drawer_layout.dart';
import 'widgets/nav_bar/nav_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to my homepage',
      theme: buildBaseAppTheme(context, Brightness.light),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFFFFF),
            Color(0xFFFFFFF),
          ],
        ),
      ),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        endDrawer: ScreenUtils.isSmallScreen(context)
            ? MyDrawerLayout(
                onSelectedChanged: (index) {
                  if (_scaffoldKey.currentState.isEndDrawerOpen) {
                    _scaffoldKey.currentState.openDrawer();
                  } else {
                    _scaffoldKey.currentState.openEndDrawer();
                  }

                  setState(() {
                    _currentPageIndex = index;
                  });
                },
              )
            : null,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              NavBar(
                onSelectedChanged: (index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                onToggleDrawerLayout: () {
                  _scaffoldKey?.currentState?.openEndDrawer();
                },
              ),
              Body(
                pageIndex: _currentPageIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  final int pageIndex;

  const Body({Key key, this.pageIndex = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (pageIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return ProductsScreen();
      case 2:
        return FeaturesScreen();
      default:
        return ContactScreen();
    }
  }
}
