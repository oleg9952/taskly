import 'package:flutter/material.dart';
import 'package:taskly/shared/types.dart';

class HeaderPopup extends StatefulWidget {
  final String categoryName;
  final bool isCompletedView;

  const HeaderPopup(
      {super.key, required this.categoryName, required this.isCompletedView});

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
      itemBuilder: (context) => _getItems(),
    );
  }

  List<PopupMenuEntry> _getItems() {
    final config = _config.where(
      (element) {
        final viewType = element['viewType'] as CategoryTabViewVariant?;
        final isForBothViews = element['isForBothViews'] as bool;

        if (isForBothViews) return true;

        final isCompletedView = viewType == CategoryTabViewVariant.completed;
        final isInProgressView = viewType == CategoryTabViewVariant.inProgress;

        return widget.isCompletedView ? isCompletedView : isInProgressView;
      },
    );

    return config.map(
      (e) {
        final text = e['text'] as Map<String, dynamic>;
        final icon = e['icon'] as Map<String, dynamic>;

        final iconType = icon['type'] as IconData;
        final iconColor = icon['color'] as MaterialColor;

        final textValue = text['value'] as String;
        final textColor = text['color'] as Color;

        return PopupMenuItem(
          child: Row(
            children: [
              Icon(
                iconType,
                color: iconColor,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                textValue,
                style: TextStyle(color: textColor),
              )
            ],
          ),
        );
      },
    ).toList();
  }

  List<Map<String, dynamic>> get _config => [
        {
          'text': {'value': 'Create task', 'color': Colors.blue},
          'icon': {'type': Icons.add_circle_outline, 'color': Colors.blue},
          'viewType': null,
          'isForBothViews': true
        },
        {
          'text': {'value': 'Delete task', 'color': Colors.blue},
          'icon': {'type': Icons.delete_forever_rounded, 'color': Colors.blue},
          'viewType': null,
          'isForBothViews': true
        },
        {
          'text': {'value': 'Complete All', 'color': Colors.blue},
          'icon': {'type': Icons.done_all_outlined, 'color': Colors.blue},
          'viewType': CategoryTabViewVariant.inProgress,
          'isForBothViews': false
        },
        {
          'text': {'value': 'Incomplete All', 'color': Colors.blue},
          'icon': {'type': Icons.remove_done, 'color': Colors.blue},
          'viewType': CategoryTabViewVariant.completed,
          'isForBothViews': false
        },
        {
          'text': {'value': 'Clear all "In Progress"', 'color': Colors.red},
          'icon': {
            'type': Icons.cleaning_services_outlined,
            'color': Colors.red
          },
          'viewType': CategoryTabViewVariant.inProgress,
          'isForBothViews': false
        },
        {
          'text': {'value': 'Clear all "Completed"', 'color': Colors.red},
          'icon': {
            'type': Icons.cleaning_services_rounded,
            'color': Colors.red
          },
          'viewType': CategoryTabViewVariant.completed,
          'isForBothViews': false
        },
        {
          'text': {
            'value':
                'Delete all tasks from ${widget.categoryName.toUpperCase()}',
            'color': Colors.red
          },
          'icon': {'type': Icons.delete_sweep, 'color': Colors.red},
          'viewType': null,
          'isForBothViews': true
        }
      ];
}
