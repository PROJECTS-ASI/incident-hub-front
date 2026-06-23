import 'package:flutter/material.dart';
import 'package:incident_hub/models/dropdown.dart';

class ValueFieldSimple extends StatelessWidget {
  final String label;
  final String value;

  const ValueFieldSimple({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: _getValueColor(label, value),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFormFieldIncident extends StatelessWidget {
  final String labelText;
  final int? maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const TextFormFieldIncident({
    super.key,
    required this.labelText,
    this.maxLines,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(Icons.title),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: validator,
    );
  }
}

class DropdownListIncident extends StatelessWidget {
  final List<DropdownItem> items;
  final IconData icon;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final String labelText;
  final String? Function(String?)? validator;

  const DropdownListIncident({
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
        labelText: labelText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
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

Color _getValueColor(String label, String value) {
    if (label == 'Estado') {
      switch (value) {
        case 'PENDIENTE':
          return Colors.red;
        case 'EN PROCESO':
          return Colors.blue;
        case 'RESUELTO':
          return Colors.green;
        case 'RECHAZADO':
          return Colors.red;
      }
    }
    return Colors.black87;
  }