import 'package:flutter/material.dart';
import 'package:lazu_tree/app/features/link_tree/models/link_section.dart';
import 'package:lazu_tree/app/features/link_tree/widgets/link_tree_card.dart';
import 'package:lazu_tree/app/features/link_tree/widgets/link_tree_tile.dart';
import 'package:lazu_tree/app/shared/utils/app_breakpoints.dart';

class LinkTreeSectionsFactory extends StatelessWidget {
  const LinkTreeSectionsFactory({required this.sections, super.key});

  final List<LinkSection> sections;

  @override
  Widget build(BuildContext context) {
    final maxWidth = Size.fromWidth(AppBreakpoints.medium.toDouble());
    final boxConstraints = BoxConstraints(maxWidth: maxWidth.width);

    return ConstrainedBox(
      constraints: boxConstraints,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: sections.length,
          itemBuilder: (context, index) {
            final section = sections[index];
            final isTile = section.containerType.isTile;

            return isTile
                ? LinkTreeTile(section: section)
                : LinkTreeCard(section: section);
          },
        ),
      ),
    );
  }
}
