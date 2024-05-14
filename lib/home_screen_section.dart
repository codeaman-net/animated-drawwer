import 'package:flutter/material.dart';

class HomeScreenSection extends StatelessWidget {
  const HomeScreenSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
      ),
    );
  }
}
