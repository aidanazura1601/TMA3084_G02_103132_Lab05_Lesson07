import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.school, size: 100, color: Colors.teal),
          SizedBox(height: 16),
          Text(
            'School Screen',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Classes and assignments', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
