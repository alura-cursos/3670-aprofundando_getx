import 'package:flutter/material.dart';
import 'package:vidflow/utils/colors.dart';

class CustomField extends StatelessWidget {
  const CustomField({super.key, required this.label, required this.textController});
  final String label;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            label,
            style: TextStyle(
              color: AppColors.blueAccent,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        TextFormField(
          controller: textController,
          decoration: InputDecoration(
            constraints: const BoxConstraints(maxHeight: 40),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: AppColors.mediumGrey),
            ),
          ),
        ),
      ],
    );
  }
}
