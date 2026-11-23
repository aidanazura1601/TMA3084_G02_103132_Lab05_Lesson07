import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.business, size: 100, color: Colors.teal),
          SizedBox(height: 16),
          Text(
            'Business Screen',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Your work and meetings', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
