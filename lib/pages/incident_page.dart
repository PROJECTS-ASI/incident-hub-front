import 'package:flutter/material.dart';
import 'package:incident_hub/pages/creation_incident_page.dart';
import 'package:incident_hub/pages/detail_incident_page.dart';
import 'package:incident_hub/pages/profile_user_page.dart';
import 'package:incident_hub/widgets/incident_widget.dart';

final List<Map<String, String>> incidents = [];

class IncidentPage extends StatefulWidget  {
  static const String id = 'incident_page';
  const IncidentPage({super.key});

  @override
  State<IncidentPage> createState() => _IncidentPageState();
}

class _IncidentPageState extends State<IncidentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: incidents.isEmpty ? notRecords() : Column(
        children: [
          searchBar(),
          Expanded(child: withRecords()),
        ],
      ),
      floatingActionButton: addButton(),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: Text(
        "INCIDENCIAS",
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
      actions: [
        IconButton(
          icon: const Icon(Icons.person, size: 35, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, ProfileUserPage.id);
          },
        )
      ],
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
    return ListView.builder(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 80),
      itemCount: incidents.length,
      itemBuilder: (context, index) {
        final incident = incidents[index];
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
                    Text(incident['title']!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
                    IconButton(
                      icon: const Icon(Icons.arrow_circle_right, size: 21),
                      onPressed: () {
                        Navigator.pushNamed(context, DetailIncidentPage.id, arguments: incident);
                      },
                      color: Colors.lightBlue,
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ValueFieldSimple(label: "Aula", value: incident["classroom"]!),
                    ValueFieldSimple(label: "Estado", value: incident["status"]!),
                  ],
                ),
                SizedBox(height: 5),
                ValueFieldSimple( label: "Creado por", value: incident["creator"]!),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ValueFieldSimple(label: "Rol",  value: incident["rol"]!),
                    ValueFieldSimple(label: "Fecha de registro", value: incident["date"]!),
                  ],
                ),
                SizedBox(height: 8),
                ValueFieldSimple(label: "Descripción", value: incident["description"]!),
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
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
        ),
        backgroundColor: Colors.blue,
        onPressed: () async {
          final newIncident = await Navigator.pushNamed(
            context,
            CreationIncidentPage.id,
          );
          if (newIncident != null) {
            setState(() {
              incidents.add(newIncident as Map<String, String>);
            });
          }
        },
        child: const Icon(Icons.add, size: 32, color: Colors.white),
      ),
    );
  }
}