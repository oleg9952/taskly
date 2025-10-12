import 'package:flutter/material.dart';

import '../../../shared/constants.dart';
import '../../../shared/types.dart';
import 'task_card.dart';

class CategoryTabView extends StatelessWidget {
  final CategoryTabViewVariant variant;

  CategoryTabView({super.key, required this.variant});

  final List<int> items = List.generate(50, (i) => i);

  @override
  Widget build(BuildContext context) {
    final insets = MediaQuery.viewPaddingOf(context);

    return ReorderableListView.builder(
      padding: EdgeInsets.only(
        top: 10,
        left: HORIZONTAL_PADDING + insets.left,
        right: HORIZONTAL_PADDING + insets.right,
        bottom: 30,
      ),
      onReorder: (oldIndex, newIndex) {
        if (newIndex > oldIndex) newIndex -= 1;
        final item = items.removeAt(oldIndex);
        items.insert(newIndex, item);
      },
      proxyDecorator: (child, index, animation) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, _) {
            final t = Curves.easeOut.transform(animation.value);

            return Transform.scale(
              scale: 1 + 0.06 * t,
              child: Container(
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    shadows: const [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: -5,
                        offset: Offset(0, 3),
                        color: Colors.black26,
                      )
                    ]),
                child: child,
              ),
            );
          },
        );
      },
      itemCount: items.length,
      itemBuilder: (context, index) {
        return TaskCard(
          key: Key('$index'),
          variant: variant,
        );
      },
    );
  }
}
