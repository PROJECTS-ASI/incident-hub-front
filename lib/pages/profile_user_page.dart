import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:incident_hub/pages/login_page.dart';
import 'package:intl/intl.dart';
import 'package:incident_hub/data/user_repository.dart';
import 'package:incident_hub/models/dropdown.dart';
import 'package:incident_hub/pages/incident_page.dart';
import 'package:incident_hub/validations/auth_validation.dart';
import 'package:incident_hub/widgets/app_bar_widget.dart';
import 'package:incident_hub/widgets/auth_widget.dart';
import 'package:incident_hub/widgets/incident_widget.dart';

class ProfileUserPage extends StatefulWidget {
  static const String id = 'profile_user_page';
  const ProfileUserPage({super.key});

  @override
  State<ProfileUserPage> createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends State<ProfileUserPage> {
  User get userDB => UserSession.currentUser!;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final roleController = TextEditingController();
  final cellphoneController = TextEditingController();
  final directionController = TextEditingController();
  final documentController = TextEditingController();
  bool initialized = false;

  @override
  Widget build(BuildContext context) {
    if (!initialized) {
      emailController.text = userDB.email;
      nameController.text = userDB.name;
      lastNameController.text = userDB.lastName;
      roleController.text = DropdownUtils.getName(userRole, userDB.role);
      cellphoneController.text = userDB.cellphone;
      directionController.text = userDB.direction;
      documentController.text = userDB.document;
      initialized = true;
    }

    return Scaffold(
      appBar: PagesAppBar(title: "PERFIL DE USUARIO", arrowBack: true, route: IncidentPage.id),
      body: profileDetail(),
    );
  }

  Widget profileDetail() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                emailTextField(),
                SizedBox(height: 10),
                nameTextField(),
                SizedBox(height: 10),
                lastNameTextField(),
                SizedBox(height: 10),
                cellphoneTextField(),
                SizedBox(height: 10),
                directionTextField(),
                SizedBox(height: 10),
                documentTextField(),
                SizedBox(height: 10),
                roleTextField(),
                SizedBox(height: 10),
                informationSection(),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    updateButton(userDB.email),
                    logoutButton(userDB.email),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget informationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        SizedBox(height: 10),
        ValueFieldSimple(
          label: "Fecha de registro", 
          value: DateFormat('dd/MM/yyyy HH:mm').format(userDB.createdDate)
        ),
      ],
    );
  }
  
  Widget emailTextField() {
    return TextFormFieldGeneral(
      keyboardType: TextInputType.emailAddress,
      icon: Icons.email_outlined,
      labelText: "Correo",
      hintText: "jimmy1999@gmail.com",
      onChanged: (value) {},
      readOnly: true,
      controller: emailController,
    );
  }

  Widget nameTextField() {
    return TextFormFieldGeneral(
      keyboardType: TextInputType.name,
      icon: Icons.person_outline,
      labelText: "Nombres",
      hintText: "Jimmy Patrick",
      onChanged: (value) {},
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r"[a-zA-ZáéíóúÁÉÍÓÚñÑ ]")),
      ],
      controller: nameController,
      validator: validateName,
    );
  }

  Widget lastNameTextField() {
    return TextFormFieldGeneral(
      keyboardType: TextInputType.name,
      icon: Icons.person_outline,
      labelText: "Apellidos",
      hintText: "Page Heston",
      onChanged: (value) {},
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r"[a-zA-ZáéíóúÁÉÍÓÚñÑ ]")),
      ],
      controller: lastNameController,
      validator: validateLastName,
    );
  }

  Widget cellphoneTextField() {
    return TextFormFieldGeneral(
      keyboardType: TextInputType.phone,
      icon: Icons.phone,
      labelText: "Celular",
      hintText: "987654321",
      onChanged: (value) {},
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(9),
      ],
      controller: cellphoneController,
      validator: validateCellphone,
    );
  }

  Widget directionTextField() {
    return TextFormFieldGeneral(
      keyboardType: TextInputType.text,
      icon: Icons.directions,
      labelText: "Dirección",
      hintText: "Av. Tomas Marzano...",
      onChanged: (value) {},
      controller: directionController,
      validator: validateDirection,
    );
  }

  Widget documentTextField() {
    return TextFormFieldGeneral(
      keyboardType: TextInputType.text,
      icon: Icons.edit_document,
      labelText: "DNI",
      hintText: "87654321",
      onChanged: (value) {},
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(8),
      ],
      controller: documentController,
      validator: validateDocument,
    );
  }

  Widget roleTextField() {
    return TextFormFieldGeneral(
      keyboardType: TextInputType.text,
      icon: Icons.person,
      labelText: "Rol",
      hintText: "",
      onChanged: null,
      readOnly: true,
      controller: roleController,
    );
  }

  Widget updateButton(String email) {
    return ElevatedButton.icon(
      icon: Icon(Icons.save, color: Colors.white),
      label: Text("ACTUALIZAR", style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 20, 121, 204),
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          final updateUser = UserRepository.updateUser(
            email: email,
            name: nameController.text, 
            lastName: lastNameController.text, 
            cellphone: cellphoneController.text, 
            direction: directionController.text, 
            document: documentController.text, 
            updatedDate: DateTime.now(),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: 
              Text(updateUser ? "Datos actualizados." : "El usuario no existe."),
              backgroundColor: updateUser ? Colors.blue : Colors.red
            )
          );
          return;
        }
      },
    );
  }

  Widget logoutButton(String email) {
    return ElevatedButton.icon(
      label: Text("CERRAR SESIÓN", style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 195, 53, 43),
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {
        UserSession.logout();
        Navigator.pushNamedAndRemoveUntil(context, LoginPage.id, (route) => false);
      },
    );
  }
}