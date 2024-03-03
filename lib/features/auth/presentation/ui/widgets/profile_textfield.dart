import 'package:flutter/material.dart';

import '../../../../../config/app_config.dart';

class ProfileTextfield extends StatelessWidget {
  final String label;
  final Function(String?) onSave;
  final String? Function(String?) validator;
  final FocusNode focus;
  final TextInputType? inputType;

  const ProfileTextfield(
      {required this.label,
      required this.onSave,
      required this.validator,
      required this.focus,
        this.inputType,

      super.key});

  factory ProfileTextfield.nome(
          {required Function(String?) saving,
            required String? Function(String?) validator,
          }) =>
      ProfileTextfield(
        label: 'Seu nome',
        onSave: saving,
        validator: validator,
        focus: FocusNode(),
      );

  factory ProfileTextfield.phone({
    required Function(String?) saving,
    required String? Function(String?) validator,
  }) =>
      ProfileTextfield(
        label: 'Numero de telefone',
        onSave: saving,
        validator: validator,
        inputType: TextInputType.phone,
        focus: FocusNode(),
      );

  factory ProfileTextfield.email({
    required Function(String?) saving,
    required String? Function(String?) validator,
  }) =>
      ProfileTextfield(
        label: 'Seu email',
        onSave: saving,
        validator: validator,
        inputType: TextInputType.emailAddress,
        focus: FocusNode(),
      );

  factory ProfileTextfield.senha({
    required Function(String?) saving,
    required String? Function(String?) validator,
  }) =>
      ProfileTextfield(
        label: 'Senha',
        onSave: saving,
        validator: validator,
        focus: FocusNode(),
      );

  factory ProfileTextfield.retypeSenha({
    required Function(String?) saving,
    required String? Function(String?) validator,
  }) =>
      ProfileTextfield(
        label: 'Repita a senha',
        onSave: saving,
        validator: validator,
        focus: FocusNode(),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        focusNode: focus,
        decoration: InputDecoration(
            label: Text(label),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            filled: true,
            fillColor: Colors.white),
        onSaved: onSave,
        validator: validator,
          keyboardType: inputType,
      ),
    );
  }
}
