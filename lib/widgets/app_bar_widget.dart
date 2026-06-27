import 'package:flutter/material.dart';
import 'package:incident_hub/pages/profile_user_page.dart';

class PagesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool arrowBack;
  final String? route;
  final bool profile;

  const PagesAppBar({
    super.key,
    required this.title,
    this.arrowBack = false,
    this.route,
    this.profile = false,
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
      leading: arrowBack && route != null ? IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: () {
          Navigator.pushReplacementNamed(context, route!);
        },
      ): null,
      actions: profile ? [
        IconButton(
          icon: Icon(Icons.person, size: 35, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, ProfileUserPage.id);
          },
        )
      ] : null,
      toolbarHeight: 100,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}