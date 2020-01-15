import 'package:flutter/material.dart';
import 'package:helloweb/widgets/responsive_layout/responsive_layout.dart';

abstract class BaseScreenLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: buildLargeLayout(),
      smallScreen: buildSmallLayout(),
    );
  }

  /// Build your large layout
  Widget buildLargeLayout() {
    return Container(
      child: Center(
        child: Text("Large layout"),
      ),
    );
  }

  /// Build your small layout
  Widget buildSmallLayout() {
    return Container(
      child: Center(
        child: Text("Small layout"),
      ),
    );
  }
}
