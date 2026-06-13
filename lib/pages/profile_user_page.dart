import 'package:flutter/material.dart';
import 'package:incident_hub/widgets/app_bar_widget.dart';
import 'package:incident_hub/widgets/incident_widget.dart';

class ProfileUserPage extends StatefulWidget {
  static const String id = 'profile_user_page';
  const ProfileUserPage({super.key});

  @override
  State<ProfileUserPage> createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends State<ProfileUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PagesAppBar(title: "PERFIL"),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Datos del Usuario", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue)),
                SizedBox(height: 20),
                ValueFieldSimple(label: "Nombres", value: "Jesus Antonio Atauqui Tito"),
                SizedBox(height: 10),
                ValueFieldSimple(label: "Correo", value: "atauqui15@gmail.com"),
                SizedBox(height: 10),
                ValueFieldSimple( label: "Rol", value: "Estudiante"),
                SizedBox(height: 10),
                ValueFieldSimple(label: "Fecha de registro",  value: "10/06/26"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}