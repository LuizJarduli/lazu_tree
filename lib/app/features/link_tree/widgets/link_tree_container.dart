import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazu_tree/app/features/link_tree/link_tree_cubit.dart';
import 'package:lazu_tree/app/features/link_tree/widgets/link_tree_body.dart';
import 'package:lazu_tree/app/shared/extensions/app_breakpoints_ext.dart';
import 'package:lazu_tree/app/shared/utils/app_breakpoints.dart';

class LinkTreeContainer extends StatelessWidget {
  const LinkTreeContainer({super.key});

  double _getHorizontalPadding(bool isSmall, double currentWidth) {
    final effectiveHorizontalPadding =
        isSmall ? 50 : (currentWidth - AppBreakpoints.small.toDouble()) / 2;

    return effectiveHorizontalPadding.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return BlocBuilder<LinkTreeCubit, LinkTreeState>(
                  builder: (context, state) {
                    final isSmall = constraints.isSmall;
                    final currentWidth = constraints.maxWidth;
                    final effectiveHorizontalPadding = _getHorizontalPadding(
                      isSmall,
                      currentWidth,
                    );

                    final effectivePadding =
                        state.isEditing
                            ? EdgeInsets.symmetric(
                              horizontal: effectiveHorizontalPadding,
                            ).copyWith(top: 50, bottom: 100)
                            : EdgeInsets.zero;

                    return AnimatedPadding(
                      padding: effectivePadding,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      child: const LinkTreeBody(),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
