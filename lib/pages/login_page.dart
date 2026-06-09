import 'package:flutter/material.dart';
import 'package:incident_hub/pages/incident_page.dart';
import 'package:incident_hub/pages/register_page.dart';
import 'package:incident_hub/widgets/auth_widget.dart';

class LoginPage extends StatelessWidget {
  static const String id = 'login_page';
  const LoginPage({super.key});

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
    );
  }

  Widget emailTextField() {
    return TextFieldGeneral(
      keyboardType: TextInputType.emailAddress,
      icon: Icons.email_outlined,
      labelText: "Correo",
      hintText: "jimmy1999@gmail.com",
    );
  }

  Widget passwordTextField() {
    return TextFieldGeneral(
      keyboardType: TextInputType.emailAddress,
      icon: Icons.lock_outline_rounded,
      labelText: "Contraseña",
      hintText: "********",
    );
  }

  Widget loginButton() {
    return ButtonAuth(
      text: "INICIAR SESIÓN",
      route: IncidentPage.id,
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