import 'package:flutter/material.dart';
import 'package:vidflow/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.text, this.icon});
  final Function onTap;
  final IconData? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () => onTap(),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColors.blueAccent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          child: Row(
            children: <Widget>[
              icon != null ? _IconButton(icon: icon) : Container(),
              Text(
                text,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({
    super.key,
    required this.icon,
  });

  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Icon(
        icon,
        size: 16,
        color: Colors.white,
      ),
    );
  }
}
