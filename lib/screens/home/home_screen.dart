import 'package:flutter/material.dart';
import 'package:helloweb/screens/base/base_screen.dart';

class HomeScreen extends BaseScreenLayout {
  @override
  Widget buildLargeLayout() {
    return SizedBox(
      height: 600,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.centerRight,
            widthFactor: .6,
            child: Image.network("assets/graphics/image_01.png", scale: .85),
          ),
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: .6,
            child: Padding(
              padding: EdgeInsets.only(left: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Hello!",
                      style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          fontFamily: "GoogleSans",
                          color: Color(0xFF8591B0))),
                  RichText(
                    text: TextSpan(
                        text: "WellCome To ",
                        style:
                            TextStyle(fontSize: 60, color: Color(0xFF8591B0)),
                        children: [
                          TextSpan(
                              text: "Britu",
                              style: TextStyle(
                                  fontSize: 60,
                                  fontFamily: "GoogleSans",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87))
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 20),
                    child: Text(
                      "LET’S EXPLORE THE WORLD",
                      style: TextStyle(
                        fontFamily: "GoogleSans",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget buildSmallLayout() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Hello!",
              style: TextStyle(
                  fontSize: 40,
                  color: Color(0xFF8591B0),
                  fontWeight: FontWeight.bold,
                  fontFamily: "GoogleSans"),
            ),
            RichText(
              text: TextSpan(
                text: 'WellCome To ',
                style: TextStyle(
                  fontSize: 40,
                  color: Color(0xFF8591B0),
                  fontFamily: "GoogleSans",
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Britu',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          fontFamily: "GoogleSans",
                          color: Colors.black87)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 20),
              child: Text(
                "LET’S EXPLORE THE WORLD",
                style: TextStyle(fontFamily: "GoogleSans"),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image.network(
                // "./res/graphics/image_01.png",
                "assets/graphics/image_01.png", scale: 1,
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
}
