class DropdownItem {
  final String code;
  final String name;

  DropdownItem({
    required this.code,
    required this.name,
  });
}

final List<DropdownItem> userRole = [
  DropdownItem(code: 'STUDENT', name: 'Estudiante'),
  DropdownItem(code: 'TEACHER', name: 'Docente'),
  DropdownItem(code: 'TECHNICAL_SUPPORT', name: 'Soporte técnico'),
  DropdownItem(code: 'ADMIN', name: 'Administrador'),
];

final List<DropdownItem> instituteClassroom = [
  DropdownItem(code: 'C01', name: 'Aula 101'),
  DropdownItem(code: 'C02', name: 'Aula 102'),
  DropdownItem(code: 'C03', name: 'Aula 103'),
  DropdownItem(code: 'C04', name: 'Aula 104'),
  DropdownItem(code: 'C05', name: 'Aula 105'),
];

final List<DropdownItem> incidentType = [
  DropdownItem(code: 'T01', name: 'Hardware'),
  DropdownItem(code: 'T02', name: 'Software'),
  DropdownItem(code: 'T03', name: 'Red'),
  DropdownItem(code: 'T04', name: 'Infraestructura'),
];

final List<DropdownItem> incidentStatus = [
  DropdownItem(code: 'PENDING', name: 'Pendiente'),
  DropdownItem(code: 'IN_PROCESS', name: 'En proceso'),
  DropdownItem(code: 'ATTENDED', name: 'Atendido'),
  DropdownItem(code: 'REJECTED', name: 'Rechazado'),
];

class DropdownUtils {
  static String getName(List<DropdownItem> list, String code) {
    return list.firstWhere((item) => 
      item.code == code,
      orElse: () => DropdownItem(code: code, name: code),
    ).name;
  }
}