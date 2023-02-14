import 'package:flutter/material.dart';

class AppColors {
  const AppColors({
    required this.bgSidebarLeft,
    required this.bgDrawerListTile,
    required this.bgDashboard,
    required this.hoverListTile,
    required this.black,
    required this.white,
    required this.grey,
    required this.lightGrey,
    required this.green,
    required this.red,
    required this.textOnBgDashboard,
    required this.bgDashboardBox,
    required this.textOnDashboardBox,
    required this.bgDialog,
    required this.titleDialog,
  });

  final Color bgSidebarLeft;
  final Color bgDrawerListTile;
  final Color bgDashboard;
  final Color hoverListTile;
  final Color textOnBgDashboard;
  final Color bgDashboardBox;
  final Color textOnDashboardBox;
  final Color bgDialog;
  final Color titleDialog;

  final Color black;
  final Color white;
  final Color grey;
  final Color lightGrey;
  final Color green;
  final Color red;

  factory AppColors.light() => const AppColors(
        bgSidebarLeft: Color(0xff202123),
        bgDrawerListTile: Color(0xff61876E),
        bgDashboard: Color(0xffF5F5F5),
        hoverListTile: Color.fromARGB(35, 240, 238, 237),
        textOnBgDashboard: Colors.black,
        bgDashboardBox: Colors.white,
        textOnDashboardBox: Colors.black,
        bgDialog: Color(0xffF5F5F5),
        titleDialog: Colors.black,
        black: Colors.black,
        white: Colors.white,
        grey: Colors.grey,
        lightGrey: Color(0xffD5d5d5),
        green: Color(0xff1C6758),
        red: Color(0xffe93646),
      );

  factory AppColors.dark() => const AppColors(
        bgSidebarLeft: Color(0xff202123),
        bgDrawerListTile: Color(0xff61876E),
        bgDashboard: Color.fromARGB(255, 4, 114, 103),
        hoverListTile: Color.fromARGB(35, 240, 238, 237),
        textOnBgDashboard: Colors.white,
        bgDashboardBox: Color(0xff212125),
        textOnDashboardBox: Colors.white,
        bgDialog: Colors.black,
        titleDialog: Colors.white,
        black: Colors.black,
        white: Colors.white,
        grey: Colors.grey,
        lightGrey: Color(0xffD5d5d5),
        green: Color(0xff1C6758),
        red: Color(0xffe93646),
      );
}

extension AppColorsExtension on BuildContext {
  AppColors get colors => _colorFromBrightness(Theme.of(this).brightness);

  AppColors _colorFromBrightness(Brightness brightness) {
    if (brightness == Brightness.light) {
      return AppColors.light();
    } else {
      return AppColors.dark();
    }
  }
}
