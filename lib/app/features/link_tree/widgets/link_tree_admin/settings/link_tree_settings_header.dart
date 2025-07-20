import 'package:flutter/material.dart';
import 'package:lazu_tree/app/features/link_tree/models/user.dart';

class LinkTreeSettingsHeader extends StatelessWidget {
  const LinkTreeSettingsHeader({required this.user, super.key});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 60, 16, 24),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.primaryContainer.withValues(alpha: 0.1),
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
      ),
      child: Column(
        children: [
          _UserAvatar(user: user),
          const SizedBox(height: 16),
          _UserName(user: user),
          const SizedBox(height: 4),
          _UserEmail(user: user),
        ],
      ),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  const _UserAvatar({required this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      child: ClipOval(
        child:
            user?.image != null
                ? Image.network(
                  user!.image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.person,
                      size: 40,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    );
                  },
                )
                : Icon(
                  Icons.person,
                  size: 40,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
      ),
    );
  }
}

class _UserName extends StatelessWidget {
  const _UserName({required this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Text(
      user?.name ?? 'Usuário',
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _UserEmail extends StatelessWidget {
  const _UserEmail({required this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Text(
      user?.email ?? 'usuario@exemplo.com',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      textAlign: TextAlign.center,
    );
  }
}
