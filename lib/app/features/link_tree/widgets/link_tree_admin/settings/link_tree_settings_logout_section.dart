import 'package:flutter/material.dart';

class LinkTreeSettingsLogoutSection extends StatelessWidget {
  const LinkTreeSettingsLogoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.errorContainer.withValues(alpha: 0.1),
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
      ),
      child: InkWell(
        onTap: () {
          // TODO(lugalokinho): Implement logout functionality
          Navigator.pop(context);
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.errorContainer.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Theme.of(context).colorScheme.error.withValues(alpha: 0.2),
            ),
          ),
          child: Row(
            children: [
              _LogoutIcon(),
              const SizedBox(width: 16),
              _LogoutText(),
            ],
          ),
        ),
      ),
    );
  }
}

class _LogoutIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.error,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(
        Icons.logout,
        size: 20,
        color: Colors.white,
      ),
    );
  }
}

class _LogoutText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        'Sair',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }
}
