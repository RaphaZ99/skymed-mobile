import 'package:flutter/material.dart';
import 'logo.dart';

class BarraTopo extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return new AppBar(
      title: Text(
        'SkyMed',
        style: TextStyle(
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
      leading: Logo(),
      backgroundColor: Colors.white,
      toolbarHeight: 90,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}
