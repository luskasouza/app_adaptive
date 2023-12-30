import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class TextFormFieldPasswordWidget extends StatefulWidget {
  final TextEditingController? controller;

  const TextFormFieldPasswordWidget({Key? key, this.controller})
      : super(key: key);

  @override
  _TextFormFieldPasswordWidgetState createState() =>
      _TextFormFieldPasswordWidgetState();
}

class _TextFormFieldPasswordWidgetState
    extends State<TextFormFieldPasswordWidget> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller, // Use o controlador fornecido
      obscureText: _obscurePassword,
      validator: Validatorless.multiple([
        Validatorless.required('Senha é obrigatória.'),
        Validatorless.min(8, 'Pelo menos 8 caracteres')
      ]),
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.all(0.0),
          child: Icon(
            Icons.lock,
            color: Colors.grey,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
        hintText: 'Senha',
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
