import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;

  const PasswordInput({
    super.key, 
    required this.controller
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _isPasswordVisible,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        hintText: 'Password',
        hintStyle: TextStyle(color: AppColors.text100, fontSize: 14, fontWeight: FontWeight.w400),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 1),
        ),
        suffixIcon: IconButton(
          icon: Icon(
             _isPasswordVisible ? Icons.visibility_off : Icons.visibility, 
             size: 20
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        )
      ),
    );
  }
}