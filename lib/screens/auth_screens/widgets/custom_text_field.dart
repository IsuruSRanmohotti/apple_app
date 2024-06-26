import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      required this.prefixIcon,
      this.isPassword = false,
      this.controller, this.textInputType});

  final String hint;
  final IconData prefixIcon;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType? textInputType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 4),
      child: TextField(
        keyboardType: widget.textInputType,
        controller: widget.controller,
        obscureText: isObscure,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: const TextStyle(color: Colors.white),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ))
                : null,
            prefixIcon: Icon(
              widget.prefixIcon,
              color: Colors.white70,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            fillColor: Colors.grey.shade600,
            filled: true,
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(50)))),
      ),
    );
  }
}
