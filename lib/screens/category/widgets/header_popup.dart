import 'package:flutter/material.dart';
import 'package:taskly/screens/category/widgets/drag_handler.dart';
import 'package:taskly/shared/types.dart';
import 'package:taskly/widgets/forms/task_form.dart';

import 'deps.dart';

class HeaderPopup extends StatefulWidget {
  final String categoryName;
  final CategoryTabViewVariant viewVariant;

  const HeaderPopup(
      {super.key, required this.categoryName, required this.viewVariant});

  @override
  State<HeaderPopup> createState() => _HeaderPopupState();
}

class _HeaderPopupState extends State<HeaderPopup> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      icon: const Icon(Icons.edit_note),
      iconSize: 30,
      itemBuilder: (context) => _renderItems(),
    );
  }

  void _handleAction(ActionVariants variant) {
    if (variant.name == ActionVariants.createTask.name) {
      // Get system padding info (e.g., notch height, status bar height)
      final double topPadding = MediaQuery.of(context).padding.top;
      // Get the height of the AppBar itself (standard height is kToolbarHeight)
      const double appBarHeight = kToolbarHeight;
      // Total height available for the entire screen.
      final double screenHeight = MediaQuery.of(context).size.height;

      // Calculate the remaining height, ensuring the sheet doesn't cover the AppBar area.
      // We subtract both the status bar padding AND the height of a potential AppBar.
      final double desiredMaxHeight =
          screenHeight - (topPadding + appBarHeight);

      // Calculate the fraction (0.0 to 1.0) for the max height.
      final double maxFraction = desiredMaxHeight / screenHeight;

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        builder: (
          BuildContext context,
        ) {
          final keyboardInset = MediaQuery.of(context).viewInsets.bottom;

          return Container(
            padding: EdgeInsets.only(bottom: keyboardInset),
            child: DraggableScrollableSheet(
              expand: false,
              maxChildSize: maxFraction,
              minChildSize: 0.5,
              builder: (context, scrollController) => SingleChildScrollView(
                controller: scrollController,
                child: TaskForm(),
              ),
            ),
          );
        },
      );

      // showModalBottomSheet(
      //   context: context,
      //   isScrollControlled: true,
      //   showDragHandle: true,

      //   builder: (
      //     BuildContext context,
      //   ) {
      //     return Padding(
      //         padding: EdgeInsets.only(
      //             bottom: MediaQuery.of(context).viewInsets.bottom,
      //             left: 12,
      //             right: 12),
      //         child: TaskForm());
      //   },
      // );
    } else if (variant.name == ActionVariants.deleteTask.name) {
    } else if (variant.name == ActionVariants.completeAll.name) {
    } else if (variant.name == ActionVariants.incompleteAll.name) {
    } else if (variant.name == ActionVariants.clearAllInProgress.name) {
    } else if (variant.name == ActionVariants.clearAllCompleted.name) {
    } else if (variant.name == ActionVariants.clearCategory.name) {}
  }

  List<PopupMenuEntry> _renderItems() {
    final isInProgressView =
        widget.viewVariant.name == CategoryTabViewVariant.inProgress.name;
    final config =
        isInProgressView ? inProgressActionVariants : completedActionVariants;

    return config.map(
      (variant) {
        final action = allActions.firstWhere(
          (element) => element.variant.name == variant.name,
        );

        return PopupMenuItem(
          onTap: () => _handleAction(variant),
          child: Row(
            children: [
              Icon(
                action.iconType,
                color: action.iconColor,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                action.label,
                style: TextStyle(color: action.labelColor),
              )
            ],
          ),
        );
      },
    ).toList();
  }
}
