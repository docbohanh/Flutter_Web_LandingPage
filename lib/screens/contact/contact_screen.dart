import 'package:flutter/material.dart';
import 'package:helloweb/screens/base/base_screen.dart';
import 'package:helloweb/style/custom_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  ContactScreen({Key key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends BaseScreenLayout<ContactScreen> {
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
            child: Image.network("assets/graphics/image_04.png", scale: .85),
          ),
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: .6,
            child: Padding(
              padding: EdgeInsets.only(left: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Text("Contact",
                      style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          fontFamily: "GoogleSans",
                          color: Color(0xFF12b897))),
                  Container(
                    width: 80,
                    height: 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xFF12b897),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ..._buildContentView(context),
                ],
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
            SizedBox(
              height: 10,
            ),
            Text("Contact",
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    fontFamily: "GoogleSans",
                    color: Color(0xFF12b897))),
            Container(
              width: 80,
              height: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color(0xFF12b897),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ..._buildContentView(context),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image.network(
                "assets/graphics/image_04.png", scale: 1,
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

List<Widget> _buildContentView(BuildContext context) {
  List<Widget> res = [];

  res.add(_buildRow(
      context, CustomIcons.location, "Location", "HoChiMinh city, Vietnam"));
  res.add(InkWell(
      onTap: () {
        launch("tel:+84 933 730 750");
      },
      child:
          _buildRow(context, CustomIcons.phone, "Phone", "(+84) 933 730 750")));
  res.add(InkWell(
    onTap: () {
      launch("http://iceteastudio.click/");
    },
    child: _buildRow(
        context, CustomIcons.web, "Website", "http://iceteastudio.click/"),
  ));
  res.add(InkWell(
      onTap: () {
        launch("https://fb.me/ndtanh");
      },
      child: _buildRow(
          context, CustomIcons.facebook, "Facebook", "fb.com/ndtanh")));
  res.add(InkWell(
      onTap: () {
        launch("whatsapp://send?phone=${84933730750}");
      },
      child: _buildRow(
          context, CustomIcons.whatapp, "WhatApp", "(+84) 933 730 750")));

  return res;
}

Widget _buildRow(
    BuildContext context, IconData iconData, String text, String value) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Icon(
          iconData,
          color: Color(0xFF12b897),
        ),
        SizedBox(
          width: 120,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        Text(value,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF12b897),
            )),
      ],
    ),
  );
}
