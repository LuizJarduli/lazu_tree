import 'package:flutter/material.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(context).colorScheme.onSurface,
            width: 2,
          ),
        ),
        child: Image.asset(
          'images/logo.png',
          width: 100,
          fit: BoxFit.cover,
          semanticLabel: 'Achados da lazu Logo',
        ),
      ),
    );
  }
}
