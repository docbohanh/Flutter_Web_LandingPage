import 'package:flutter/material.dart';

class MyDrawerLayout extends StatelessWidget {
  final ValueChanged<int> onSelectedChanged;

  const MyDrawerLayout({Key key, this.onSelectedChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _navLinks = ["Home", "Products", "Features", "Contact"];
    var _width = MediaQuery.of(context).size.width * .65;

    List<Widget> _menuItems = _navLinks
        .asMap()
        .map((index, element) => MapEntry(
            index,
            ListTile(
              title: Text(_navLinks[index]),
              onTap: () {
                onSelectedChanged(index);
              },
            )))
        .values
        .toList();

    return Container(
      color: Colors.white,
      width: _width,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              child: Center(
                child: Image.network(
                  // "./res/graphics/image_01.png",
                  "assets/graphics/logo.png", 
                  width: 100,
                  height: 100,
                  // scale: 1,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF12b897),
            ),
          ),
          ..._menuItems
        ],
      ),
    );
  }
}
