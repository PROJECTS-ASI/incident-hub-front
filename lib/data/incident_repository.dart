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
}

class IncidentRepository {
  static final List<Incident> incidents = [];

  static void addIncident(Incident incident) {
    incidents.add(incident);
  }

  static List<Incident> getIncidents() {
    return incidents;
  }
}