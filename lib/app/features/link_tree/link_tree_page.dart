import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart' show GoRouterState;
import 'package:lazu_tree/app/features/link_tree/link_tree_cubit.dart';
import 'package:lazu_tree/app/features/link_tree/widgets/link_tree_admin_app_bar.dart';
import 'package:lazu_tree/app/features/link_tree/widgets/link_tree_admin_bottom_bar.dart';
import 'package:lazu_tree/app/features/link_tree/widgets/link_tree_container.dart';

class LinkTreePage extends StatelessWidget {
  const LinkTreePage({super.key});

  static Widget providerPageBuilder(BuildContext context, GoRouterState state) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LinkTreeCubit>(create: (context) => LinkTreeCubit()),
      ],
      child: const LinkTreePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LinkTreeAdminAppBar(),
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.grey.shade200,
      body: const LinkTreeContainer(),
      bottomNavigationBar: const LinkTreeAdminBottomBar(),
    );
  }
}
