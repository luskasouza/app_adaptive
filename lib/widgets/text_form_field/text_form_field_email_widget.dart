import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class TextFormFieldEmailWidget extends StatefulWidget {
  final TextEditingController? controller; // Adicione um controlador opcional

  const TextFormFieldEmailWidget({Key? key, this.controller}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TextFormFieldEmailWidgetState createState() =>
      _TextFormFieldEmailWidgetState();
}

class _TextFormFieldEmailWidgetState extends State<TextFormFieldEmailWidget> {
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      validator: Validatorless.multiple([
        Validatorless.email('E-mail inválido.'),
        Validatorless.required('E-mail e obrigatório.')
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
            Icons.email,
            color: Colors.grey,
          ),
        ),
        hintText: 'E-mail',
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
