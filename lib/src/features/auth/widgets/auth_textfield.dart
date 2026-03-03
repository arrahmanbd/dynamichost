import 'package:dynamichostbd/src/core/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const AuthTextField({
    super.key,
    required this.label,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          TextField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
          ),
        ],
      ),
    );
  }
}