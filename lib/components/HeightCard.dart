import 'package:flutter/material.dart';

class Heightcard extends StatelessWidget {
  final double height;
  final ValueChanged<double> setHeight;
  const Heightcard({super.key, required this.setHeight, required this.height});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Height",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w100,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$height",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  " cm",
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                ),
              ],
            ),
            Slider(
              min: 120,
              max: 250,
              onChanged: setHeight,
              value: height,
              thumbColor: Theme.of(context).colorScheme.secondary,
              activeColor: Theme.of(context).colorScheme.secondary,
              inactiveColor: Theme.of(context).colorScheme.onPrimary,
            ),
          ],
        ),
      ),
    ); //
  }
}
