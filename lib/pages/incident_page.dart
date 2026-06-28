import 'package:flutter/material.dart';
import 'package:incident_hub/data/user_repository.dart';
import 'package:incident_hub/models/dropdown.dart';
import 'package:incident_hub/widgets/app_bar_widget.dart';
import 'package:intl/intl.dart';
import 'package:incident_hub/data/incident_repository.dart';
import 'package:incident_hub/pages/creation_incident_page.dart';
import 'package:incident_hub/pages/detail_incident_page.dart';
import 'package:incident_hub/widgets/incident_widget.dart';

class IncidentPage extends StatefulWidget  {
  static const String id = 'incident_page';
  const IncidentPage({super.key});

  @override
  State<IncidentPage> createState() => _IncidentPageState();
}

class _IncidentPageState extends State<IncidentPage> {
  String get email => UserSession.currentEmail!;
  User get userDB => UserRepository.getUserByEmail(email)!;
  final incidents = IncidentRepository.getIncidents();
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PagesAppBar(title: "INCIDENCIAS", profile: true),
      body: incidents.isEmpty ? notRecords() : Column(
        children: [
          searchBar(),
          Expanded(child: withRecords()),
        ],
      ),
      floatingActionButton: addButton(),
    );
  }

  Widget notRecords() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox, size: 60, color: Colors.grey),
          SizedBox(height: 10),
          Text(
            'SIN INCIDENCIAS REGISTRADAS',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        onChanged: (value) {
          setState(() {
            searchText = value;
          });
        },
        decoration: InputDecoration(
          hintText: "Buscar incidencia...",
          prefixIcon: Icon(Icons.search),
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 12,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }

  Widget withRecords() {
    final filteredIncidents = incidents.where((incident) {
      return incident.title.toLowerCase().contains(searchText.trim().toLowerCase());
    }).toList();

    return ListView.builder(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 80),
      itemCount: filteredIncidents.length,
      itemBuilder: (context, index) {
        final incident = filteredIncidents[index];
        return Card(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(incident.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
                    IconButton(
                      icon: Icon(Icons.arrow_circle_right, size: 22),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, DetailIncidentPage.id, arguments: incident);
                      },
                      color: Colors.lightBlue,
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ValueFieldSimple(
                      label: "Aula", 
                      value: DropdownUtils.getName(instituteClassroom, incident.classroom)
                    ),
                    ValueFieldSimple(
                      label: "Estado", 
                      value: DropdownUtils.getName(incidentStatus, incident.status), valueBold: true
                    ),
                  ],
                ),
                SizedBox(height: 7),
                ValueFieldSimple(
                  label: "Creado por", 
                  value: incident.creator.name
                ),
                SizedBox(height: 7),
                ValueFieldSimple(
                  label: "Fecha de registro", 
                  value: DateFormat('dd/MM/yyyy HH:mm').format(incident.createdDate)
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget addButton() {
    return SizedBox(
      width: 35,
      height: 35,
      child: userDB.role != 'TECHNICAL_SUPPORT' ? FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
        ),
        backgroundColor: Colors.blue,
        onPressed: () async {
          await Navigator.pushReplacementNamed(
            context,
            CreationIncidentPage.id,
          );
          setState(() {});
        },
        child: const Icon(Icons.add, size: 32, color: Colors.white),
      ) : null,
    );
  }
}