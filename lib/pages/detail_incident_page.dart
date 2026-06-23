import 'package:flutter/material.dart';
import 'package:incident_hub/data/incident_repository.dart';
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
    final incident = ModalRoute.of(context)!.settings.arguments as Incident;

    return Scaffold(
      appBar: PagesAppBar(title: "DETALLE INCIDENCIA"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      incident.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Chip(
                      label: Text(incident.status),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      "INFORMACIÓN GENERAL",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Divider(),
                    ValueFieldSimple(
                      label: "Tipo",
                      value: incident.type,
                    ),
                    ValueFieldSimple(
                      label: "Aula",
                      value: incident.classroom,
                    ),
                    ValueFieldSimple(
                      label: "Descripción",
                      value: incident.description,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      "REPORTADO POR",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Divider(),
                    ValueFieldSimple(
                      label: "Nombre",
                      value: incident.creator.name,
                    ),
                    ValueFieldSimple(
                      label: "Correo",
                      value: incident.creator.email,
                    ),
                    ValueFieldSimple(
                      label: "Rol",
                      value: incident.creator.role,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      "ATENCIÓN",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Divider(),
                    ValueFieldSimple(
                      label: "Técnico asignado",
                      value:
                          incident.technicalSupport?.name ??
                          "Sin asignar",
                    ),
                    ValueFieldSimple(
                      label: "Correo técnico",
                      value:
                          incident.technicalSupport?.email ??
                          "-",
                    ),
                    ValueFieldSimple(
                      label: "Fecha asignación",
                      value:
                          incident.assignmentDate?.toString() ??
                          "-",
                    ),
                    ValueFieldSimple(
                      label: "Fecha atención",
                      value:
                          incident.attentionDate?.toString() ??
                          "-",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      "FECHAS",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const Divider(),
                    ValueFieldSimple(
                      label: "Creado",
                      value: incident.createdDate.toString(),
                    ),
                    ValueFieldSimple(
                      label: "Actualizado",
                      value: incident.updatedDate.toString(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("VOLVER"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}