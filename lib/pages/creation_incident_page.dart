import 'package:flutter/material.dart';
import 'package:incident_hub/models/dropdown.dart';
import 'package:uuid/uuid.dart';
import 'package:incident_hub/data/incident_repository.dart';
import 'package:incident_hub/data/user_repository.dart';
import 'package:incident_hub/validations/incident_validation.dart';
import 'package:incident_hub/widgets/app_bar_widget.dart';
import 'package:incident_hub/widgets/incident_widget.dart';

class CreationIncidentPage extends StatefulWidget {
  static const String id = 'creation_incident_page';
  const CreationIncidentPage({super.key});

  @override
  State<CreationIncidentPage> createState() => _CreationIncidentPageState();
}

class _CreationIncidentPageState extends State<CreationIncidentPage> {
  final formKey = GlobalKey<FormState>();
  final userDB = UserSession.currentUser!;
  final titleController = TextEditingController();
  final classroomController = TextEditingController();
  final descriptionController = TextEditingController();
  String? selectedClassroom;
  String? selectedType;

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
              key: formKey,
              child: Column(
                children: [
                  textFormFieldTitle(),
                  SizedBox(height: 16),
                  dropdownListFieldClassroom(),
                  SizedBox(height: 16),
                  dropdownListFieldType(),
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
      controller: titleController,
      validator: validateTitle,
    );
  }

  Widget dropdownListFieldClassroom() {
    return DropdownListIncident(
      items: instituteClassroom.toList(),
      icon: Icons.person,
      selectedValue: selectedClassroom, 
      labelText: 'Seleccione su Aula',
      onChanged: (value) {
        setState(() {
          selectedClassroom = value;
        });
      },
      validator: validateClassroom,
    );
  }

  Widget dropdownListFieldType() {
    return DropdownListIncident(
      items: incidentType.toList(),
      icon: Icons.person,
      selectedValue: selectedType, 
      labelText: 'Seleccione un tipo de incidencia',
      onChanged: (value) {
        setState(() {
          selectedType = value;
        });
      },
      validator: validateType,
    );
  }

  Widget textFormFieldDescription() {
    return TextFormFieldIncident(
      labelText: 'Descripción',
      maxLines: 4,
      controller: descriptionController,
      validator: validateDescription,
    );
  }

  Widget createButton() {
    return ElevatedButton.icon(
      icon: Icon(Icons.save),
      label: Text("Crear incidencia"),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          final newIncident = Incident(
            id: Uuid().v4(),
            title: titleController.text,
            classroom: selectedClassroom!,
            type: selectedType!,
            description: descriptionController.text,
            status: "PENDING",
            creator: Creator(email: userDB.email, name: userDB.name, role: userDB.role),
            assignmentDate: null,
            technicalSupport: null,
            attentionDate: null,
            createdDate: DateTime.now(),
            updatedDate: DateTime.now(),
          );
          IncidentRepository.addIncident(newIncident);
          
          Navigator.pop(context, newIncident);
        }
      },
    );
  }
}