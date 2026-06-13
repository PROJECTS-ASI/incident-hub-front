import 'package:flutter/material.dart';
import 'package:incident_hub/pages/creation_incident_page.dart';
import 'package:incident_hub/pages/detail_incident_page.dart';
import 'package:incident_hub/pages/incident_page.dart';
import 'package:incident_hub/pages/login_page.dart';
import 'package:incident_hub/pages/profile_user_page.dart';
import 'package:incident_hub/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (_) => LoginPage(),
        RegisterPage.id: (_) => RegisterPage(),
        IncidentPage.id: (_) => IncidentPage(),
        CreationIncidentPage.id: (_) => CreationIncidentPage(),
        DetailIncidentPage.id: (_) => DetailIncidentPage(),
        ProfileUserPage.id: (_) => ProfileUserPage(),
      },
    );
  }
}