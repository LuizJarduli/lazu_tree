import 'package:flutter/material.dart';
import 'package:lazu_tree/app/features/link_tree/models/link.dart';
import 'package:lazu_tree/app/features/link_tree/models/link_section.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkTreeCard extends StatelessWidget {
  const LinkTreeCard({required this.section, super.key});

  final LinkSection section;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          if (section.title != null)
            Text(
              section.title!,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          const SizedBox(height: 16),
          SizedBox(
            height: 240,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: section.links.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    right: index < section.links.length - 1 ? 8 : 0,
                  ),
                  child: LinkTreeCardItem(link: section.links[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LinkTreeCardItem extends StatelessWidget {
  const LinkTreeCardItem({required this.link, super.key});

  final Link link;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(link.url)),
      child: Tooltip(
        message: link.url,
        child: Card(
          color: Theme.of(
            context,
          ).colorScheme.secondaryContainer.withValues(alpha: 0.2),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: SizedBox(
            width: 200,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child:
                        link.image != null
                            ? Image.network(
                              link.image!,
                              fit: BoxFit.cover,
                            )
                            : const SizedBox.shrink(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Tooltip(
                      message: link.description,
                      child: Text(
                        link.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
