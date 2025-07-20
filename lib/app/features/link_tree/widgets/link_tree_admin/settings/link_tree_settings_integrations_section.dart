import 'package:flutter/material.dart';
import 'package:lazu_tree/app/features/link_tree/widgets/link_tree_admin/settings/link_tree_settings_integration_item.dart';

class LinkTreeSettingsIntegrationsSection extends StatelessWidget {
  const LinkTreeSettingsIntegrationsSection({
    this.onPreferencesTap,
    super.key,
  });

  final VoidCallback? onPreferencesTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(),
          const SizedBox(height: 16),
          const LinkTreeSettingsIntegrationItem(
            icon: Icons.link,
            title: 'Contas Conectadas',
            subtitle: 'Gerencie suas conexões de redes sociais',
          ),
          const SizedBox(height: 8),
          const LinkTreeSettingsIntegrationItem(
            icon: Icons.analytics,
            title: 'Analíticos',
            subtitle: 'Visualize o desempenho dos seus links',
          ),
          const SizedBox(height: 8),
          LinkTreeSettingsIntegrationItem(
            icon: Icons.settings,
            title: 'Preferências',
            subtitle: 'Personalize sua experiência',
            onTap: onPreferencesTap,
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Integrações',
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
