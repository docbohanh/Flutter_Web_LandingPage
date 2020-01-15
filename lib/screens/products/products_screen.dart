
import 'package:flutter/material.dart';
import 'package:helloweb/screens/base/base_screen.dart';

class ProductsScreen extends BaseScreenLayout {
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
            child: Image.network("assets/graphics/image_02.png", scale: .85),
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
}