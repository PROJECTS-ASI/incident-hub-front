import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:incident_hub/data/user_repository.dart';
import 'package:incident_hub/models/dropdown.dart';
import 'package:incident_hub/pages/login_page.dart';
import 'package:incident_hub/validations/auth_validation.dart';
import 'package:incident_hub/widgets/auth_widget.dart';

class RegisterPage extends StatefulWidget {
  static const String id = 'register_page';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
              key: formKey,
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
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r"[a-zA-ZáéíóúÁÉÍÓÚñÑ ]")),
      ],
      controller: nameController,
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
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      controller: emailController,
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
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      controller: passwordController,
      validator: validatePassword,
    );
  }

  Widget dropdownListField() {
    final rolesToShow = userRole.where((role) => role.code != 'ADMIN').toList();
    return DropdownList(
      items: rolesToShow,
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
        if (formKey.currentState!.validate()) {
          final email = emailController.text.toLowerCase();
          final duplicateEmail = UserRepository.emailExists(email);
          if (duplicateEmail) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('El correo ya existe.')),
            );
            return;
          }

          UserRepository.addUser(
            User(
              email: email,
              password: passwordController.text,
              name: nameController.text.trim(),
              role: selectedRole!,
              createdDate: DateTime.now(),
              updatedDate: DateTime.now(),
            ),
          );
          Navigator.pushNamed(context, LoginPage.id);
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