String? validateName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Ingrese nombres y apellidos.';
  }
  if (value.trim().length < 5) {
    return 'Ingrese al menos 5 caracteres.';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Ingrese un correo.';
  }
  final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
  if (!emailRegex.hasMatch(value.trim())) {
    return 'Correo inválido.';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Ingrese una contraseña.';
  }
  if (value.length < 6) {
    return 'Ingrese al menos 6 caracteres.';
  }
  if (value.length > 12) {
    return 'No ingrese más de 12 caracteres.';
  }
  return null;
}

String? validateDropdown(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Ingrese un rol.';
  }
  return null;
}