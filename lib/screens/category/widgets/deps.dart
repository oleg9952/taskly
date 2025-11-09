import 'package:flutter/material.dart';

// ------------------------------------------------------------
// TYPES
// ------------------------------------------------------------

enum ActionVariants {
  createTask,
  deleteTask,
  completeAll,
  incompleteAll,
  clearAllInProgress,
  clearAllCompleted,
  clearCategory
}

class PopupAction {
  final String label;
  final Color labelColor;

  final IconData iconType;
  final MaterialColor iconColor;

  final ActionVariants variant;

  PopupAction(
      {required this.label,
      required this.labelColor,
      required this.iconType,
      required this.iconColor,
      required this.variant});
}

// ------------------------------------------------------------
// CONSTANTS
// ------------------------------------------------------------

final List<ActionVariants> inProgressActionVariants = [
  ActionVariants.createTask,
  ActionVariants.deleteTask,
  ActionVariants.completeAll,
  ActionVariants.clearAllInProgress,
  ActionVariants.clearCategory
];

final List<ActionVariants> completedActionVariants = [
  ActionVariants.createTask,
  ActionVariants.deleteTask,
  ActionVariants.incompleteAll,
  ActionVariants.clearAllCompleted,
  ActionVariants.clearCategory
];

final List<PopupAction> allActions = [
  PopupAction(
      label: 'Create task',
      labelColor: Colors.blue,
      iconType: Icons.add_circle_outline,
      iconColor: Colors.blue,
      variant: ActionVariants.createTask),
  PopupAction(
      label: 'Delete task',
      labelColor: Colors.blue,
      iconType: Icons.delete_forever_rounded,
      iconColor: Colors.blue,
      variant: ActionVariants.deleteTask),
  PopupAction(
      label: 'Complete All',
      labelColor: Colors.blue,
      iconType: Icons.done_all_outlined,
      iconColor: Colors.blue,
      variant: ActionVariants.completeAll),
  PopupAction(
      label: 'Incomplete All',
      labelColor: Colors.blue,
      iconType: Icons.remove_done,
      iconColor: Colors.blue,
      variant: ActionVariants.incompleteAll),
  PopupAction(
      label: 'Clear all "In Progress"',
      labelColor: Colors.red,
      iconType: Icons.cleaning_services_outlined,
      iconColor: Colors.red,
      variant: ActionVariants.clearAllInProgress),
  PopupAction(
      label: 'Clear all "Completed"',
      labelColor: Colors.red,
      iconType: Icons.cleaning_services_rounded,
      iconColor: Colors.red,
      variant: ActionVariants.clearAllCompleted),
  PopupAction(
      label: 'Clear category',
      labelColor: Colors.red,
      iconType: Icons.delete_sweep,
      iconColor: Colors.red,
      variant: ActionVariants.clearCategory),
];
