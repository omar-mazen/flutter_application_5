import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final String gender;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isSelected;

  const GenderCard({
    super.key,
    required this.gender,
    required this.icon,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color:
                isSelected
                    ? Color(0xff24263B)
                    : Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 80, color: Colors.white),
              SizedBox(height: 8),
              Text(
                gender,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
