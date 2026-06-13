import 'package:flutter/material.dart';
import 'package:incident_hub/pages/incident_page.dart';
import 'package:incident_hub/pages/login_page.dart';
import 'package:incident_hub/widgets/auth_widget.dart';

class RegisterPage extends StatefulWidget {
  static const String id = 'register_page';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "INCIDENT\nHUB",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50.0),
                  nameTextField(),
                  SizedBox(height: 10.0),
                  emailTextField(),
                  SizedBox(height: 10.0),
                  passwordTextField(),
                  SizedBox(height: 10.0),
                  dropdownListField(),
                  SizedBox(height: 25.0),
                  registerButton(),
                  SizedBox(height: 15.0),
                  redirectText(),
                ],
              ),
            )
          ),
        ),
      ),
    );
  }

  Widget nameTextField() {
    return TextFormFieldGeneral(
      keyboardType: TextInputType.name,
      icon: Icons.person_outline,
      labelText: "Nombres y Apellidos",
      hintText: "Jimmy Page",
      onChanged: (value) {},
      validator: validateName,
    );
  }

  Widget emailTextField() {
    return TextFormFieldGeneral(
      keyboardType: TextInputType.emailAddress,
      icon: Icons.email_outlined,
      labelText: "Correo",
      hintText: "jimmy1999@gmail.com",
      onChanged: (value) {},
      validator: validateEmail,
    );
  }

  Widget passwordTextField() {
    return TextFormFieldGeneral(
      keyboardType: TextInputType.emailAddress,
      icon: Icons.lock_outline_rounded,
      labelText: "Contraseña",
      hintText: "********",
      onChanged: (value) {},
      obscureText: true,
      validator: validatePassword,
    );
  }

  Widget dropdownListField() {
    return DropdownList(
      items: [
        { 'code': 'STUDENT', 'name': 'Estudiante' },
        { 'code': 'TEACHER', 'name': 'Profesor' },
      ],
      icon: Icons.person,
      selectedValue: selectedRole, 
      labelText: 'Seleccione su rol',
      onChanged: (value) {
        setState(() {
          selectedRole = value;
        });
      },
      validator: validateDropdown,
    );
  }

  Widget registerButton() {
    return ButtonAuth(
      text: "REGISTRARSE",
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.pushNamed(context, IncidentPage.id);
        }
      },
    );
  }

  Widget redirectText() {
    return RedirectText(
      question: "¿Ya tienes una cuenta? ", 
      text: "INICIA SESIÓN", 
      route: LoginPage.id,
    );
  }
}

String? validateName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Ingrese nombres y apellidos.';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Ingrese un correo.';
  }
  if (!value.contains('@')) {
    return 'Correo inválido.';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Ingrese una contraseña.';
  }
  return null;
}

String? validateDropdown(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Ingrese un rol.';
  }
  return null;
}