import 'package:flutter/material.dart';
import 'package:taskly/shared/types.dart';

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
