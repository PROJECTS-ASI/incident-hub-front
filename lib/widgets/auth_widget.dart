import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:incident_hub/models/dropdown.dart';

class TextFormFieldGeneral extends StatelessWidget {
  final TextInputType keyboardType;
  final IconData icon;
  final String labelText;
  final String hintText;
  final Function(String)? onChanged;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const TextFormFieldGeneral({
    super.key,
    required this.keyboardType,
    required this.icon,
    required this.labelText,
    required this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.inputFormatters,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: labelText,
          hintText: hintText
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}

class RedirectText extends StatelessWidget {
  final String question;
  final String text;
  final String route;

  const RedirectText({
    super.key,
    required this.question,
    required this.text,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        question,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, route);
        },
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
  }
}

class DropdownList extends StatelessWidget {
  final List<DropdownItem> items;
  final IconData icon;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final String labelText;
  final String? Function(String?)? validator;

  const DropdownList({
    super.key,
    required this.items,
    required this.icon,
    required this.selectedValue,
    required this.onChanged,
    required this.labelText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: selectedValue,
      decoration: InputDecoration(
        hintText: labelText,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
        ),
      ),
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item.code,
          child: Text(item.name),
        );
      }).toList(),
      onChanged: onChanged,
      validator: validator,
    );
  }
}

class ButtonAuth extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonAuth({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(270, 50),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}