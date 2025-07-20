import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazu_tree/app/features/link_tree/link_tree_cubit.dart';
import 'package:lazu_tree/app/features/link_tree/widgets/link_tree_admin/settings/link_tree_settings_header.dart';
import 'package:lazu_tree/app/features/link_tree/widgets/link_tree_admin/settings/link_tree_settings_integrations_section.dart';
import 'package:lazu_tree/app/features/link_tree/widgets/link_tree_admin/settings/link_tree_settings_logout_section.dart';
import 'package:lazu_tree/app/features/link_tree/widgets/link_tree_admin/settings/link_tree_settings_preferences_page.dart';

class LinkTreeSettingsDrawer extends StatefulWidget {
  const LinkTreeSettingsDrawer({super.key});

  @override
  State<LinkTreeSettingsDrawer> createState() => _LinkTreeSettingsDrawerState();
}

class _LinkTreeSettingsDrawerState extends State<LinkTreeSettingsDrawer> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToPage(int page) {
    setState(() {
      _currentPage = page;
    });
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void _goBack() {
    if (_currentPage > 0) {
      _navigateToPage(_currentPage - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<LinkTreeCubit, LinkTreeState>(
        builder: (context, state) {
          return Column(
            children: [
              LinkTreeSettingsHeader(user: state.user),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    LinkTreeSettingsIntegrationsSection(
                      onPreferencesTap: () => _navigateToPage(1),
                    ),
                    LinkTreeSettingsPreferencesPage(
                      onBackPressed: _goBack,
                    ),
                  ],
                ),
              ),
              const LinkTreeSettingsLogoutSection(),
            ],
          );
        },
      ),
    );
  }
}
