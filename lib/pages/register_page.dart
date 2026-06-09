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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
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
              SizedBox(height: 25.0),
              registerButton(),
              SizedBox(height: 15.0),
              redirectText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget nameTextField() {
    return TextFieldGeneral(
      keyboardType: TextInputType.name,
      icon: Icons.person_outline,
      labelText: "Nombres y Apellidos",
      hintText: "Jimmy Page",
      onChanged: (value) {},
    );
  }

  Widget emailTextField() {
    return TextFieldGeneral(
      keyboardType: TextInputType.emailAddress,
      icon: Icons.email_outlined,
      labelText: "Correo",
      hintText: "jimmy1999@gmail.com",
      onChanged: (value) {},
    );
  }

  Widget passwordTextField() {
    return TextFieldGeneral(
      keyboardType: TextInputType.emailAddress,
      icon: Icons.lock_outline_rounded,
      labelText: "Contraseña",
      hintText: "********",
      onChanged: (value) {},
      obscureText: true,
    );
  }

  Widget registerButton() {
    return ButtonAuth(
      text: "REGISTRARSE",
      route: IncidentPage.id,
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