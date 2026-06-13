import 'package:flutter/material.dart';
import 'package:incident_hub/widgets/app_bar_widget.dart';
import 'package:incident_hub/widgets/incident_widget.dart';

class DetailIncidentPage extends StatefulWidget {
  static const String id = 'detail_incident_page';
  const DetailIncidentPage({super.key});

  @override
  State<DetailIncidentPage> createState() => _DetailIncidentPageState();
}

class _DetailIncidentPageState extends State<DetailIncidentPage> {
  @override
  Widget build(BuildContext context) {
    final incident = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: PagesAppBar(title: "DETALLE INCIDENCIA"),
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
                Text(incident['title']!, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue)),
                SizedBox(height: 20),
                ValueFieldSimple(label: "Aula", value: incident["classroom"]),
                SizedBox(height: 10),
                ValueFieldSimple(label: "Estado", value: incident["status"]),
                SizedBox(height: 10),
                ValueFieldSimple( label: "Creado por", value: incident["creator"]),
                SizedBox(height: 10),
                ValueFieldSimple(label: "Rol",  value: incident["rol"]),
                SizedBox(height: 10),
                ValueFieldSimple(label: "Fecha de registro", value: incident["date"]),
                SizedBox(height: 10),
                ValueFieldSimple(label: "Descripción", value: incident["description"]),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      )
    );
  }
}