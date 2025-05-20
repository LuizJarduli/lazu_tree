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
        IconButton(
          icon: Icon(Icons.arrow_back, color: isEditing ? null : Colors.white),
          onPressed: () {
            context.pop();
          },
        ),
        BlocBuilder<LinkTreeCubit, LinkTreeState>(
          builder: (context, state) {
            return IconButton(
              icon:
                  state.isEditing
                      ? const Icon(Icons.remove_red_eye)
                      : const Icon(Icons.edit, color: Colors.white),
              onPressed: () {
                context.read<LinkTreeCubit>().setIsEditing(
                  active: !state.isEditing,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
