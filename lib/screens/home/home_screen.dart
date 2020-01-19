import 'dart:async';

import 'package:flutter/material.dart';
import 'package:helloweb/screens/base/base_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseScreenLayout<HomeScreen> {
  List<String> _arrJobTitle = [
    "Mobile Developer",
    "UI/UX Designer",
    "Photographer",
    "Freelancer"
  ];
  int _currentJobPos = 0;
  Timer _timer;

  void _startTimer() {
    const oneSec = const Duration(seconds: 5);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_currentJobPos < _arrJobTitle.length - 1) {
            _currentJobPos++;
          } else {
            _currentJobPos = 0;
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
                children: _buildContent(),
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

  List<Widget> _buildContent() {
    return [
      Text("Hello!",
          style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              fontFamily: "GoogleSans",
              color: Color(0xFF3f3d56))),
      RichText(
        text: TextSpan(
            text: "Wellcome to ",
            style: TextStyle(
                fontSize: 40,
                fontFamily: "GoogleSans",
                color: Color(0xFF3f3d56)),
            children: [
              TextSpan(
                  text: "My home page",
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
              text: "I am a ",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "GoogleSans",
                  color: Color(0xFF3f3d56)),
              children: [
                TextSpan(
                    text: " ${_arrJobTitle[_currentJobPos]}",
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
