import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart' show GoRouterState;
import 'package:lazu_tree/app/features/link_tree/link_tree_cubit.dart';
import 'package:lazu_tree/app/features/link_tree/widgets/link_tree_admin_app_bar.dart';
import 'package:lazu_tree/app/shared/utils/app_breakpoints.dart';

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
    final maxWidth = AppBreakpoints.medium.toDouble();
    final constraints = BoxConstraints(maxWidth: maxWidth);

    return BlocBuilder<LinkTreeCubit, LinkTreeState>(
      builder: (context, state) {
        final effectivePadding =
            state.isEditing
                ? const EdgeInsets.all(50).copyWith(bottom: 100)
                : EdgeInsets.zero;

        return Scaffold(
          appBar: const LinkTreeAdminAppBar(),
          extendBodyBehindAppBar: true,
          body: Center(
            child: ConstrainedBox(
              constraints: constraints,
              child: Column(
                children: [
                  Expanded(
                    child: AnimatedPadding(
                      padding: effectivePadding,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.amber.shade300,
                          borderRadius:
                              state.isEditing
                                  ? BorderRadius.circular(8)
                                  : BorderRadius.zero,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: .2),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'ACHADOS\n\t\t\t\t\t\t\tDA LAZU',
                            style: TextStyle(
                              fontFamily: 'Kalufonia',
                              fontSize: 36,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
