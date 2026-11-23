import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.alarm, size: 100, color: Colors.teal),
          SizedBox(height: 16),
          Text(
            'Alarm Screen',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Set your reminders here', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
