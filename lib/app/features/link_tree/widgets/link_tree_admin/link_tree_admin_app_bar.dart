import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lazu_tree/app/features/link_tree/link_tree_cubit.dart';

// Analyzer will bother you about this
// ignore: avoid_positional_boolean_parameters
typedef LinkTreeAdminAppBarAction = void Function(bool toggle);

class LinkTreeAdminAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  /// Creates a [LinkTreeAdminAppBar].
  ///
  /// The [key] argument is optional and can be used to identify the widget.
  const LinkTreeAdminAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isEditing = context.watch<LinkTreeCubit>().state.isEditing;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: IconButton(
            style: IconButton.styleFrom(
              backgroundColor:
                  isEditing ? null : Theme.of(context).colorScheme.surface,
              elevation: isEditing ? 0 : 4,
              shape: const OvalBorder(),
            ),
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.pop();
            },
          ),
        ),
        BlocBuilder<LinkTreeCubit, LinkTreeState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(right: 16, top: 16),
              child: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor:
                      isEditing ? null : Theme.of(context).colorScheme.surface,
                  elevation: isEditing ? 0 : 4,
                  shape: const OvalBorder(),
                ),
                icon:
                    state.isEditing
                        ? const Icon(Icons.remove_red_eye)
                        : const Icon(
                          Icons.edit,
                        ),
                onPressed: () {
                  context.read<LinkTreeCubit>().setIsEditing(
                    active: !state.isEditing,
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
