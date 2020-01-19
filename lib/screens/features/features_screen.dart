import 'package:flutter/material.dart';
import 'package:helloweb/screens/base/base_screen.dart';

class FeaturesScreen extends StatefulWidget {
  FeaturesScreen({Key key}) : super(key: key);

  @override
  _FeaturesScreenState createState() => _FeaturesScreenState();
}

class _FeaturesScreenState extends BaseScreenLayout<FeaturesScreen> {
 @override
  Widget buildLargeLayout(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.centerRight,
            widthFactor: .6,
            child: Image.network("assets/graphics/image_03.png", scale: .85),
          ),
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: .6,
            child: Padding(
              padding: EdgeInsets.only(left: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildContent()
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget buildSmallLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ..._buildContent(),
            Center(
              child: Image.network(
                // "./res/graphics/image_01.png",
                "assets/graphics/image_03.png", scale: 1,
                // scale: 1,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildContent() {
    return [
      Text("",
          style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              fontFamily: "GoogleSans",
              color: Color(0xFF3f3d56))),
      RichText(
        text: TextSpan(
            text: "Happy lunar ",
            style: TextStyle(
                fontSize: 40,
                fontFamily: "GoogleSans",
                color: Color(0xFF3f3d56)),
            children: [
              TextSpan(
                  text: "new year",
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: "GoogleSans",
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF12b897)))
            ]),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: RichText(
          text: TextSpan(
              text: "The year of  ",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "GoogleSans",
                  color: Color(0xFF3f3d56)),
              children: [
                TextSpan(
                    text: "the rat",
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: "GoogleSans",
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF12b897)))
              ]),
        ),
      ),
      SizedBox(
        height: 40,
      ),
    ];
  }
}

