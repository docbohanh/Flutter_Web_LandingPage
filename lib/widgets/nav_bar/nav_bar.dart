

import 'package:flutter/material.dart';
import 'package:helloweb/style/custom_icons.dart';
import 'package:helloweb/utils/screen_utils.dart';

class NavBar extends StatefulWidget {
  final ValueChanged<int> onSelectedChanged;
  final VoidCallback onToggleDrawerLayout;

  const NavBar({Key key, this.onSelectedChanged, this.onToggleDrawerLayout}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final navLinks = ["Home", "Products", "Features", "Contact"];

  int _selectedIndex = 0;

  List<Widget> navItem() {
    return navLinks
        .asMap()
        .map((index, element) => MapEntry(
            index,
            InkWell(
              onTap: () {
                widget.onSelectedChanged(index);
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    // width: double.infinity,
                    width: 80,
                    height: 4,
                    margin: EdgeInsets.only(top: 25),
                    decoration: _selectedIndex == index
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color(0xFF12b897),
                          )
                        : null,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(navLinks[index],
                        style: TextStyle(
                            fontFamily: "GoogleSans",
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            )))
        .values
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 38),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: LinearGradient(colors: [
                  Color(0xFF12b897),
                  Color(0xFF15cda8),
                ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
                          child: Center(
                child: Image.network(
                  // "./res/graphics/image_01.png",
                  "assets/graphics/logo.png", scale: 1,
                  // scale: 1,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            ".Hawk",
            style: TextStyle(
              fontSize: 26,
              fontFamily: "GoogleSans",
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Container(
              child: (!ScreenUtils.isSmallScreen(context))
                  ? Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[...navItem()]),
                    )
                  : IconButton(
                      icon: Icon(CustomIcons.menu),
                      onPressed: () {
                        widget.onToggleDrawerLayout();
                      },
                    )),
        ],
      ),
    );
  }
}
