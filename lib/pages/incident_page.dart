import 'package:flutter/material.dart';
import 'package:incident_hub/widgets/app_bar_widget.dart';


final List<Map <String, String>> incidents = [
  {
    "titulo": "Proyector averiado",
    "aula": "A-101",
    "estado": "Pendiente",
    "fecha": "08/06/2026"
  },
  {
    "titulo": "Proyector averiado",
    "aula": "A-101",
    "estado": "Pendiente",
    "fecha": "08/06/2026"
  },
  {
    "titulo": "Proyector averiado",
    "aula": "A-101",
    "estado": "Pendiente",
    "fecha": "08/06/2026"
  },
  {
    "titulo": "Proyector averiado",
    "aula": "A-101",
    "estado": "Pendiente",
    "fecha": "08/06/2026"
  },
  {
    "titulo": "Proyector averiado",
    "aula": "A-101",
    "estado": "Pendiente",
    "fecha": "08/06/2026"
  },
  {
    "titulo": "Proyector averiado",
    "aula": "A-101",
    "estado": "Pendiente",
    "fecha": "08/06/2026"
  }
];

class IncidentPage extends StatelessWidget {
  static const String id = 'incident_page';
  const IncidentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PagesAppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        itemCount: incidents.length,
        itemBuilder: (context, index) {
          final incident = incidents[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    incident['titulo']!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),

                  Text("Aula: ${incident["aula"]}"),
                  Text("Estado: ${incident["estado"]}"),
                  Text("Fecha: ${incident["fecha"]}"),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
