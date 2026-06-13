import 'package:flutter/material.dart';

class PagesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const PagesAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 15, 100, 169),
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
      toolbarHeight: 100,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}