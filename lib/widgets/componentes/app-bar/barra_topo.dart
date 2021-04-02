import 'package:flutter/material.dart';
import 'package:skymed_mobile/views/menu-usuario.dart';
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
      actions: [
        IconButton(
          icon: Icon(Icons.menu),
          color: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WidgetMenuUsuario()),
            );
          },
        ),
      ],
      backgroundColor: Colors.white,
      toolbarHeight: 90,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}
