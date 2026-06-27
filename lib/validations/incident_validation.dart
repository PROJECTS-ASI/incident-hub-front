String? validateTitle(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Ingrese un título.';
  }
  if (value.trim().length < 8) {
    return 'Ingrese al menos 8 caracteres.';
  }
  return null;
}

String? validateClassroom(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Ingrese un aula o laboratorio.';
  }
  return null;
}

String? validateType(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Ingrese un tipo de incidencia.';
  }
  return null;
}

String? validateDescription(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Ingrese una descripción.';
  }
  if (value.trim().length < 8) {
    return 'Ingrese al menos 8 caracteres.';
  }
  return null;
}