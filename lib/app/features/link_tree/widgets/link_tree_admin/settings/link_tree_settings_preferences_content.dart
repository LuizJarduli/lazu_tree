import 'package:flutter/material.dart';
import 'package:lazu_tree/app/features/link_tree/widgets/link_tree_admin/settings/link_tree_settings_preference_item.dart';

class LinkTreeSettingsPreferencesContent extends StatelessWidget {
  const LinkTreeSettingsPreferencesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _PreferencesSection(
              title: 'Aparência',
              items: [
                LinkTreeSettingsPreferenceItem(
                  icon: Icons.palette,
                  title: 'Tema',
                  subtitle: 'Escolha entre tema claro ou escuro',
                  onTap: () {
                    // TODO(lugalokinho): Implement theme switching
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            _PreferencesSection(
              title: 'Notificações',
              items: [
                LinkTreeSettingsPreferenceItem(
                  icon: Icons.notifications,
                  title: 'Alertas',
                  subtitle: 'Gerencie suas notificações',
                  onTap: () {
                    // TODO(lugalokinho): Implement notification settings
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            _PreferencesSection(
              title: 'Privacidade',
              items: [
                LinkTreeSettingsPreferenceItem(
                  icon: Icons.security,
                  title: 'Segurança',
                  subtitle: 'Configurações de segurança da conta',
                  onTap: () {
                    // TODO(lugalokinho): Implement security settings
                  },
                ),
                LinkTreeSettingsPreferenceItem(
                  icon: Icons.privacy_tip,
                  title: 'Dados',
                  subtitle: 'Gerencie seus dados pessoais',
                  onTap: () {
                    // TODO(lugalokinho): Implement data management
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PreferencesSection extends StatelessWidget {
  const _PreferencesSection({
    required this.title,
    required this.items,
  });

  final String title;
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 12),
        ...items,
      ],
    );
  }
}
