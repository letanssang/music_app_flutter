import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  final formKey;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const EmailField({Key? key, this.controller, this.validator, this.formKey})
      : super(key: key);

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 70,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: TextFormField(
          key: widget.formKey,
          controller: widget.controller,
          validator: widget.validator,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            fillColor: Colors.white24,
            filled: true,
            focusColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
