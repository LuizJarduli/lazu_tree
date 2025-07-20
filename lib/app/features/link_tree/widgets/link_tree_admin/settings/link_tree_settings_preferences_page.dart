import 'package:flutter/material.dart';
import 'package:lazu_tree/app/features/link_tree/widgets/link_tree_admin/settings/link_tree_settings_preferences_content.dart';

class LinkTreeSettingsPreferencesPage extends StatelessWidget {
  const LinkTreeSettingsPreferencesPage({
    required this.onBackPressed,
    super.key,
  });

  final VoidCallback onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _PreferencesHeader(onBackPressed: onBackPressed),
        const Expanded(
          child: LinkTreeSettingsPreferencesContent(),
        ),
      ],
    );
  }
}

class _PreferencesHeader extends StatelessWidget {
  const _PreferencesHeader({required this.onBackPressed});

  final VoidCallback onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: onBackPressed,
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Voltar',
          ),
          const SizedBox(width: 8),
          Text(
            'Preferências',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
