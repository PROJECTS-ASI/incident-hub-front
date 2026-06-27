import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:incident_hub/data/user_repository.dart';
import 'package:incident_hub/pages/incident_page.dart';
import 'package:incident_hub/pages/register_page.dart';
import 'package:incident_hub/validations/auth_validation.dart';
import 'package:incident_hub/widgets/auth_widget.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login_page';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: formKey,
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
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      controller: emailController,
      validator: validateEmail,
    );
  }

  Widget passwordTextField() {
    return TextFormFieldGeneral(
      keyboardType: TextInputType.visiblePassword,
      icon: Icons.lock_outline_rounded,
      labelText: "Contraseña",
      hintText: "********",
      obscureText: true,
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      controller: passwordController,
      validator: validatePassword,
    );
  }

  Widget loginButton() {
    return ButtonAuth(
      text: "INICIAR SESIÓN",
      onPressed: () {
        if (formKey.currentState!.validate()) {
          final email = emailController.text.toLowerCase();
          final user = UserRepository.login(email, passwordController.text);
          if (user == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Usuario o contraseña incorrectos.')),
            );
            return;
          }
          UserSession.currentUser = user;
          Navigator.pushReplacementNamed(context, IncidentPage.id);
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