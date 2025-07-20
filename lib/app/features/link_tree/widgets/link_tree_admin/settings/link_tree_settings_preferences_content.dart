import 'package:flutter/material.dart';
import 'package:lazu_tree/app/features/link_tree/widgets/link_tree_admin/settings/link_tree_settings_preference_item.dart';
import 'package:lazu_tree/app/features/link_tree/widgets/link_tree_admin/settings/link_tree_theme_switch.dart';

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
            const LinkTreeSettingsPreferencesSection(
              title: 'Aparência',
              items: [
                LinkTreeThemeSwitchWithLabel(),
              ],
            ),
            const SizedBox(height: 24),
            LinkTreeSettingsPreferencesSection(
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
            LinkTreeSettingsPreferencesSection(
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

class LinkTreeSettingsPreferencesSection extends StatelessWidget {
  const LinkTreeSettingsPreferencesSection({
    required this.title,
    required this.items,
    super.key,
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
