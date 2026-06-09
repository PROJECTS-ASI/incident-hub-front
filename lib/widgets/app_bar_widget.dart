import 'package:flutter/material.dart';

class PagesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PagesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Mis Incidencias",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
      ),
      backgroundColor: Colors.blue,
      elevation: 10,
      shadowColor: Colors.black,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back), 
        color: Colors.lightBlue,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        Icon(Icons.search, color: Colors.lightBlue, size: 30),
        Icon(Icons.more_vert, color: Colors.lightBlue, size: 30),
      ],
      toolbarHeight: 100,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}