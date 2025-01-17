import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:flutter/material.dart';

class AuthInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const AuthInput({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.text100, fontSize: 14, fontWeight: FontWeight.w400),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 1),
        )
      ),
    );
  }
}
