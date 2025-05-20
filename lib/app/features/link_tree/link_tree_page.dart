import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart' show GoRouterState;
import 'package:lazu_tree/app/core/logger/logger.dart';
import 'package:lazu_tree/app/features/link_tree/link_tree_cubit.dart';
import 'package:lazu_tree/app/features/link_tree/link_tree_repository.dart';
import 'package:lazu_tree/app/features/link_tree/widgets/link_tree_admin_app_bar.dart';
import 'package:lazu_tree/app/features/link_tree/widgets/link_tree_admin_bottom_bar.dart';
import 'package:lazu_tree/app/features/link_tree/widgets/link_tree_container.dart';

class LinkTreePage extends StatefulWidget {
  const LinkTreePage({super.key});

  static Widget providerPageBuilder(BuildContext context, GoRouterState state) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<LinkTreeRepository>(
          create: (context) => const LinkTreeRepository(),
        ),
        BlocProvider<LinkTreeCubit>(
          create:
              (context) => LinkTreeCubit(
                context.read<LinkTreeRepository>(),
                context.read<Logger>(),
              ),
        ),
      ],
      child: const LinkTreePage(),
    );
  }

  @override
  State<LinkTreePage> createState() => _LinkTreePageState();
}

class _LinkTreePageState extends State<LinkTreePage> {
  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      context.read<LinkTreeCubit>().getUserTree();
    });
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
