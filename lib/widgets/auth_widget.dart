import 'package:flutter/material.dart';

class TextFieldGeneral extends StatelessWidget {
  final TextInputType keyboardType;
  final IconData icon;
  final String labelText;
  final String hintText;
  final Function(String)? onChanged;
  final bool obscureText;

  const TextFieldGeneral({
    super.key,
    required this.keyboardType,
    required this.icon,
    required this.labelText,
    required this.hintText,
    this.onChanged,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: TextField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: labelText,
          hintText: hintText
        ),
        onChanged: onChanged,
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
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    ],
  );
  }
}

class ButtonAuth extends StatelessWidget {
  final String text;
  final String route;

  const ButtonAuth({
    super.key,
    required this.text,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {
        Navigator.pushNamed(context, route),
      },
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