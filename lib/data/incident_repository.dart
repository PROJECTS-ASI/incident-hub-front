class Creator {
  final String email;
  final String name;
  final String role; //ADMIN - STUDENT - TEACHER - TECHNICAL_SUPPORT

  Creator({
    required this.email,
    required this.name,
    required this.role,
  });
}

class TechnicalSupport {
  final String email;
  final String name;

  TechnicalSupport({
    required this.email,
    required this.name,
  });
}

class Incident {
  final String id;
  final String title;
  final String classroom;
  final String type;
  final String description;
  final String status; // PENDING - IN_PROCESS - ATTENDED - REJECTED
  final Creator creator;
  final DateTime? assignmentDate;
  final TechnicalSupport? technicalSupport;
  final DateTime? attentionDate;
  final DateTime createdDate;
  final DateTime updatedDate;

  Incident({
    required this.id,
    required this.title,
    required this.classroom,
    required this.type,
    required this.description,
    required this.status,
    required this.creator,
    required this.assignmentDate,
    required this.technicalSupport,
    required this.attentionDate,
    required this.createdDate,
    required this.updatedDate,
  });

  Incident update({
    String? title,
    String? classroom,
    String? type,
    String? description,
    String? status,
    Creator? creator,
    TechnicalSupport? technicalSupport,
    DateTime? assignmentDate,
    DateTime? attentionDate,
    DateTime? createdDate,
    DateTime? updatedDate,
  }) {
    return Incident(
      id: id,
      title: title ?? this.title,
      classroom: classroom ?? this.classroom,
      type: type ?? this.type,
      description: description ?? this.description,
      status: status ?? this.status,
      creator: creator ?? this.creator,
      technicalSupport: technicalSupport ?? this.technicalSupport,
      assignmentDate: assignmentDate ?? this.assignmentDate,
      attentionDate: attentionDate ?? this.attentionDate,
      createdDate: createdDate ?? this.createdDate,
      updatedDate: updatedDate ?? this.updatedDate,
    );
  }
}

class IncidentRepository {
  static final List<Incident> incidents = [];

  static void addIncident(Incident incident) {
    incidents.add(incident);
  }

  static bool updateIncident({ 
    required String id,
    required String title,
    required String classroom,
    required String type,
    required String description,
    required DateTime updatedDate,
  }) {
    final index = incidents.indexWhere((i) => i.id == id);

    if (index == -1) {
      return false;
    }

    final record = incidents[index];
    incidents[index] = record.update(
      title: title,
      classroom: classroom,
      type: type,
      description: description,
      updatedDate: updatedDate,
    );
    return true;
  }

  static List<Incident> getIncidents() {
    return incidents;
  }
}