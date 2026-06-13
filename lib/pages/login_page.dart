import 'package:flutter/material.dart';
import 'package:incident_hub/pages/incident_page.dart';
import 'package:incident_hub/pages/register_page.dart';
import 'package:incident_hub/widgets/auth_widget.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login_page';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

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
                    "INCIDENT\nHUB".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50.0),
                  emailTextField(),
                  SizedBox(height: 10.0),
                  passwordTextField(),
                  SizedBox(height: 20.0),
                  loginButton(),
                  SizedBox(height: 15.0),
                  redirectText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget emailTextField() {
    return TextFormFieldGeneral(
      keyboardType: TextInputType.emailAddress,
      icon: Icons.email_outlined,
      labelText: "Correo",
      hintText: "jimmy1999@gmail.com",
      validator: validateEmail,
    );
  }

  Widget passwordTextField() {
    return TextFormFieldGeneral(
      keyboardType: TextInputType.emailAddress,
      icon: Icons.lock_outline_rounded,
      labelText: "Contraseña",
      hintText: "********",
      obscureText: true,
      validator: validatePassword,
    );
  }

  Widget loginButton() {
    return ButtonAuth(
      text: "INICIAR SESIÓN",
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.pushNamed(context, IncidentPage.id);
        }
      },
    );
  }

  Widget redirectText () {
    return RedirectText(
      question: "¿No tienes una cuenta? ", 
      text: "REGÍSTRATE",
      route: RegisterPage.id,
    );
  }
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