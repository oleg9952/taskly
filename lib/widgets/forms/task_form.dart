import 'package:flutter/material.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // -----------------------
        // Title field
        // -----------------------
        Text(
          'Task Title',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
              hintText: 'e.g., Buy groceries',
              hintStyle: TextStyle(color: Colors.grey),
              fillColor: Color(0xFFDCDCDC),
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none)),
        ),
        SizedBox(
          height: 20,
        ),

        // -----------------------
        // Description field
        // -----------------------
        Text(
          'Task Description',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          maxLength: 100,
          maxLines: 5,
          minLines: 5,
          decoration: InputDecoration(
              fillColor: Color(0xFFDCDCDC),
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none)),
        ),

        // -----------------------
        // Submit button
        // -----------------------
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        )
      ],
    );
  }
}
