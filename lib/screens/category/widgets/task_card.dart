import 'package:flutter/material.dart';

import '../../../shared/constants.dart';
import '../../../shared/types.dart';

class TaskCard extends StatelessWidget {
  final CategoryTabViewVariant variant;

  const TaskCard({super.key, required this.variant});

  bool get isCompleted => variant == CategoryTabViewVariant.completed;

  @override
  Widget build(BuildContext context) {
    final textDecoration =
        isCompleted ? TextDecoration.lineThrough : TextDecoration.none;

    return GestureDetector(
      onTap: () {
        // TODO: move task to completed
        print('mark as completed');
      },
      onLongPress: () {
        // TODO: show fullscreen preview with ability to edit
        print('show preview');
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(CARD_BORDER_RADIUS)),
        child: Padding(
          padding: const EdgeInsets.all(CARD_PADDING),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // -----------------------
                    // Title
                    // -----------------------
                    Text(
                      'Some task...',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          decoration: textDecoration),
                    ),

                    // -----------------------
                    // Description
                    // -----------------------
                    Text(
                      'Some description',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.grey[800], decoration: textDecoration),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  // -----------------------
                  // Circular checkbox
                  // -----------------------
                  iconByVariant()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Icon iconByVariant() {
    if (isCompleted) {
      return Icon(
        Icons.check_circle,
        size: 30,
        color: Colors.blue[400],
      );
    }

    return Icon(
      Icons.circle_outlined,
      size: 30,
      color: Colors.grey[400],
    );
  }
}
