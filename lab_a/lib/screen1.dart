import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.home, size: 100, color: Colors.teal),
          SizedBox(height: 16),
          Text(
            'Home Screen',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Welcome to Lab A', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
