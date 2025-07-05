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
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius:
                state.isEditing ? BorderRadius.circular(8) : BorderRadius.zero,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 150,
                child: Image.asset(
                  'images/banner_placeholder.jpg',
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.overlay,
                  color: Theme.of(context).colorScheme.shadow,
                ),
              ),
              const LinkTreeProfileContainer(),
            ],
          ),
        );
      },
    );
  }
}
