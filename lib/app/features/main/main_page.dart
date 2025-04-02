import 'package:flutter/material.dart';
import 'package:lazu_tree/app/features/main/widgets/wip_placeholder.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 70, vertical: 50),
        child: WipPlaceholder(),
      ),
    );
  }
}
