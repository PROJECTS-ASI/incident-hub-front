import 'package:flutter/material.dart';
import 'package:incident_hub/widgets/app_bar_widget.dart';
import 'package:incident_hub/widgets/incident_widget.dart';

class CreationIncidentPage extends StatefulWidget {
  static const String id = 'creation_incident_page';
  const CreationIncidentPage({super.key});

  @override
  State<CreationIncidentPage> createState() => _CreationIncidentPageState();
}

class _CreationIncidentPageState extends State<CreationIncidentPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _classroomController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PagesAppBar(title: "NUEVA INCIDENCIA"),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  textFormFieldTitle(),
                  SizedBox(height: 16),
                  textFormFieldClassroom(),
                  SizedBox(height: 16),
                  textFormFieldDescription(),
                  SizedBox(height: 24),
                  createButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textFormFieldTitle() {
    return TextFormFieldIncident(
      labelText: 'Título',
      controller: _titleController,
      validator: validateTitle,
    );
  }

  Widget textFormFieldClassroom() {
    return TextFormFieldIncident(
      labelText: 'Aula',
      controller: _classroomController,
      validator: validateClassroom,
    );
  }

  Widget textFormFieldDescription() {
    return TextFormFieldIncident(
      labelText: 'Descripción',
      maxLines: 4,
      controller: _descriptionController,
      validator: validateDescription,
    );
  }

  Widget createButton() {
    return ElevatedButton.icon(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          final newIncident = {
            "title": _titleController.text,
            "classroom": _classroomController.text,
            "status": "PENDIENTE",
            "creator": "Usuario ?",
            "rol": "Desarrollador",
            "date": "13/06/2026",
            "description": _descriptionController.text,
          };
          Navigator.pop(context, newIncident);
        }
      },
      icon: Icon(Icons.save),
      label: Text("Crear incidencia"),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

String? validateTitle(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Ingrese un título.';
  }
  return null;
}
String? validateClassroom(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Ingrese un aula.';
  }
  return null;
}
String? validateDescription(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Ingrese una descripción.';
  }
  return null;
}