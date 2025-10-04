import 'package:flutter/material.dart';

import '../constants.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CARD_BORDER_RADIUS)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Column(
              children: [
                // -----------------------
                // Icon
                // -----------------------
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Color.lerp(Colors.blue[50], Colors.blue[100], 0.5),
                      borderRadius: BorderRadius.circular(CARD_BORDER_RADIUS)),
                  child: const Icon(
                    Icons.work,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(
                  height: CARD_ELEMENTS_SPACING,
                ),

                // -----------------------
                // Info "2 of 14"
                // -----------------------
                Text(
                  '5 of 12',
                  style: TextStyle(color: Colors.grey[800]),
                ),
              ],
            ),
            const SizedBox(
              width: CARD_ELEMENTS_SPACING,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // -----------------------
                  // Title
                  // -----------------------
                  const Text(
                    'Work',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),

                  // -----------------------
                  // Description
                  // -----------------------
                  Text(
                    'Some description of the task that takes some space',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                  const SizedBox(
                    height: CARD_ELEMENTS_SPACING + 2,
                  ),

                  // -----------------------
                  // Progress bar
                  // -----------------------
                  LinearProgressIndicator(
                    value: 0.50,
                    minHeight: 10,
                    backgroundColor: Colors.blue[100],
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
