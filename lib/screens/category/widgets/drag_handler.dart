import 'package:flutter/material.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // Padding ensures the handle is slightly separated from the content
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Container(
          // The visual appearance of the handle: a rounded rectangle
          width: 40, // Short width
          height: 5, // Thin height
          decoration: BoxDecoration(
            color: Colors.grey.shade400, // Light grey color
            borderRadius: BorderRadius.circular(10), // Fully rounded corners
          ),
        ),
      ),
    );
  }
}
