/*import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const Responsive({super.key, required this.mobile, required this.desktop});

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 800) {
          return desktop;
        }
        return mobile;
      },
    );
  }
}*/

import 'package:flutter/material.dart';

class Responsive {
  // We consider anything less than 800px wide as mobile/tablet
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  static double getWidth(BuildContext context) => 
      MediaQuery.of(context).size.width;
}