import 'package:flutter/material.dart';

import '../../utils/facebook/fb_colors.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Professional dashboard',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 23, color: title_fb_color),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
    );
  }
}
