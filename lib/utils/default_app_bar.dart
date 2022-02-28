import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    Color activeColor = Colors.white;

    /*
    var brightness = MediaQuery.of(context).platformBrightness;
    Color activeColor = Colors.black;
    if (brightness != Brightness.dark)
      activeColor = Colors.white;
    */

    return Container(
      color: activeColor,
    );
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}