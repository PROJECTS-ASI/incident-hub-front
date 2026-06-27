import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:incident_hub/pages/incident_page.dart';
import 'package:incident_hub/data/incident_repository.dart';
import 'package:incident_hub/data/user_repository.dart';
import 'package:incident_hub/models/dropdown.dart';
import 'package:incident_hub/validations/incident_validation.dart';
import 'package:incident_hub/widgets/app_bar_widget.dart';
import 'package:incident_hub/widgets/incident_widget.dart';

class DetailIncidentPage extends StatefulWidget {
  static const String id = 'detail_incident_page';
  const DetailIncidentPage({super.key});

  @override
  State<DetailIncidentPage> createState() => _DetailIncidentPageState();
}

class _DetailIncidentPageState extends State<DetailIncidentPage> {
  User get userDB => UserSession.currentUser!;
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  String? selectedClassroom;
  String? selectedType;
  bool initialized = false;
  bool editAccess = false;

  @override
  Widget build(BuildContext context) {
    final incident = ModalRoute.of(context)!.settings.arguments as Incident;
    editAccess = userDB.role == 'ADMIN' || (userDB.email == incident.creator.email && incident.status == 'PENDING');

    if (!initialized) {
      titleController.text = incident.title;
      descriptionController.text = incident.description;
      selectedClassroom = incident.classroom;
      selectedType = incident.type;
      initialized = true;
    }

    return Scaffold(
      appBar: PagesAppBar(title: "DETALLE INCIDENCIA", arrowBack: true, route: IncidentPage.id),
      body: editableDetail(incident),
    );
  }

  Widget editableDetail(Incident incident) {
    return SingleChildScrollView(
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
                informationSection(incident),
                if (editAccess) ...[
                  SizedBox(height: 24),
                  updateButton(incident.id),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget informationSection(Incident incident) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        SizedBox(height: 10),
        ValueFieldSimple(
          label: "Estado",
          value: DropdownUtils.getName(incidentStatus, incident.status),
        ),
        SizedBox(height: 7),
        ValueFieldSimple(
          label: "Fecha de registro", 
          value: DateFormat('dd/MM/yyyy HH:mm').format(incident.createdDate)
        ),
        SizedBox(height: 7),
        ValueFieldSimple(
          label: "Creado por",
          value: incident.creator.name,
        ),
        SizedBox(height: 7),
        ValueFieldSimple(
          label: "Rol creador",
          value: DropdownUtils.getName(userRole, incident.creator.role),
        ),
        SizedBox(height: 7),
        ValueFieldSimple(
          label: "Correo",
          value: incident.creator.email,
        ),
        SizedBox(height: 7),
        ValueFieldSimple(
          label: "Soporte técnico",
          value: incident.technicalSupport?.name ?? '-',
        ),
        SizedBox(height: 7),
        ValueFieldSimple(
          label: "Correo soporte técnico",
          value: incident.technicalSupport?.email ?? '-',
        ),
        SizedBox(height: 7),
        ValueFieldSimple(
          label: "Fecha asignación",
          value: incident.assignmentDate != null ? DateFormat('dd/MM/yyyy HH:mm').format(incident.assignmentDate!) : '-'
        ),
        SizedBox(height: 7),
        ValueFieldSimple(
          label: "Fecha de atención",
          value: incident.assignmentDate != null ? DateFormat('dd/MM/yyyy HH:mm').format(incident.assignmentDate!) : '-'
        ),
      ],
    );
  }

  Widget textFormFieldTitle() {
    return TextFormFieldIncident(
      labelText: 'Título',
      controller: titleController,
      validator: validateTitle,
      readOnly: editAccess ? true : false,
    );
  }

  Widget dropdownListFieldClassroom() {
    return DropdownListIncident(
      items: instituteClassroom.toList(),
      icon: Icons.home,
      selectedValue: selectedClassroom, 
      labelText: 'Seleccione su Aula',
      onChanged: editAccess ? (value) {
        setState(() {
          selectedClassroom = value;
        });
      } : null,
      validator: validateClassroom,
    );
  }

  Widget dropdownListFieldType() {
    return DropdownListIncident(
      items: incidentType.toList(),
      icon: Icons.type_specimen,
      selectedValue: selectedType, 
      labelText: 'Seleccione un tipo de incidencia',
      onChanged: editAccess ? (value) {
        setState(() {
          selectedType = value;
        });
      } : null,
      validator: validateType,
    );
  }

  Widget textFormFieldDescription() {
    return TextFormFieldIncident(
      labelText: 'Descripción',
      maxLines: 4,
      controller: descriptionController,
      validator: validateDescription,
      readOnly: editAccess ? true : false,
    );
  }

  Widget updateButton(String id) {
    return ElevatedButton.icon(
      icon: Icon(Icons.save),
      label: Text("ACTUALIZAR", style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 20, 121, 204),
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          final updateIncident = IncidentRepository.updateIncident(
            id: id, 
            title: titleController.text, 
            classroom: selectedClassroom!, 
            type: selectedType!, 
            description: descriptionController.text, 
            updatedDate: DateTime.now(),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: 
              Text(updateIncident ? "Incidencia actualizada." : "La incidencia no existe."),
              backgroundColor: updateIncident ? Colors.blue : Colors.red
            )
          );
          return;
        }
      },
    );
  }
}