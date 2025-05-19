import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazu_tree/app/features/link_tree/link_tree_cubit.dart';
import 'package:lazu_tree/app/features/link_tree/widgets/link_tree_profile_container.dart';

class LinkTreeBody extends StatelessWidget {
  const LinkTreeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LinkTreeCubit, LinkTreeState>(
      buildWhen: (previous, current) => previous.isEditing != current.isEditing,
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFFBA926E),
            borderRadius:
                state.isEditing ? BorderRadius.circular(8) : BorderRadius.zero,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Column(
            children: [SizedBox(height: 150), LinkTreeProfileContainer()],
          ),
        );
      },
    );
  }
}
