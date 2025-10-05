import 'package:flutter/material.dart';

import '../../../shared/constants.dart';
import '../../../shared/types.dart';
import 'task_card.dart';

class CategoryTabView extends StatelessWidget {
  final CategoryTabViewVariant variant;

  const CategoryTabView({super.key, required this.variant});

  @override
  Widget build(BuildContext context) {
    final insets = MediaQuery.viewPaddingOf(context);

    return ListView.separated(
      padding: EdgeInsets.only(
        top: 10,
        left: HORIZONTAL_PADDING + insets.left,
        right: HORIZONTAL_PADDING + insets.right,
        bottom: 30,
      ),
      itemCount: 20,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        return TaskCard(
          variant: variant,
        );
      },
    );
  }
}
