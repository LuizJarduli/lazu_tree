import 'package:flutter/material.dart';

class AppToast extends StatelessWidget {
  const AppToast({
    required this.title,
    required this.icon,
    required this.backgroundColor,
    this.description,
    super.key,
  });

  factory AppToast.success({
    required String title,
    String? description,
  }) {
    return AppToast(
      title: title,
      description: description,
      icon: const Icon(Icons.check_circle_outline, color: Colors.white),
      backgroundColor: Colors.green,
    );
  }

  factory AppToast.error({
    required String title,
    String? description,
  }) {
    return AppToast(
      title: title,
      description: description,
      icon: const Icon(Icons.error_outline, color: Colors.white),
      backgroundColor: Colors.red,
    );
  }

  factory AppToast.info({
    required String title,
    String? description,
  }) {
    return AppToast(
      title: title,
      description: description,
      icon: const Icon(Icons.info_outline, color: Colors.white),
      backgroundColor: Colors.blue,
    );
  }

  factory AppToast.warning({
    required String title,
    String? description,
  }) {
    return AppToast(
      title: title,
      description: description,
      icon: const Icon(Icons.warning_amber_rounded, color: Colors.white),
      backgroundColor: Colors.orange,
    );
  }

  final String title;

  final String? description;

  final Icon icon;

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
                if (description != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    description!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white70,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
