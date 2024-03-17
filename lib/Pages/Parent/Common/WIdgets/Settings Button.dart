import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Constants/Colors.dart';

class SettingsButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isDanger;
  const SettingsButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7.h),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: isDanger ? Colors.red : primaryColor,
          backgroundColor: isDanger ? const Color(0xFFFFE6E6) : Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: isDanger ? Colors.red : primaryColor,
              width: 1.5,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: isDanger ? const Color(0x80640000) : primaryColor),
            const SizedBox(width: 10),
            Text(text, style: const TextStyle(fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}

// const Color(0xFF727272)
