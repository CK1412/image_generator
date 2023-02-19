import 'package:flutter/material.dart';

class AppResponsive extends StatelessWidget {
  const AppResponsive({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  static bool isMobile(context) => MediaQuery.of(context).size.width < 767;
  static bool isTablet(context) =>
      MediaQuery.of(context).size.width >= 767 &&
      MediaQuery.of(context).size.width < 1024;
  static bool isDesktop(context) => MediaQuery.of(context).size.width >= 1024;

  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) {
      return desktop;
    } else if (isTablet(context)) {
      return tablet;
    } else {
      return mobile;
    }
  }
}
