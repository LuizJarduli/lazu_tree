import 'package:flutter/material.dart';
import 'package:lazu_tree/app/features/main/widgets/wip_placeholder.dart';
import 'package:lazu_tree/app/shared/extensions/app_breakpoints_ext.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final effectivePadding =
              constraints.isSmall
                  ? EdgeInsets.zero
                  : const EdgeInsets.symmetric(horizontal: 70, vertical: 50);
          return Padding(
            padding: effectivePadding,
            child: WipPlaceholder(constraints: constraints),
          );
        },
      ),
    );
  }
}
