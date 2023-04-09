import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final GlobalKey<FormFieldState>? formKey;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const PasswordField({Key? key, this.controller, this.validator, this.formKey})
      : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 70,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Center(
        child: Stack(
          children: [
            TextFormField(
              key: widget.formKey,
              controller: widget.controller,
              validator: widget.validator,
              obscureText: _obscureText,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
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
            Positioned(
              right: 0,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
