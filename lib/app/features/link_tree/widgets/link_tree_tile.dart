import 'package:flutter/material.dart';
import 'package:lazu_tree/app/features/link_tree/models/link.dart';
import 'package:lazu_tree/app/features/link_tree/models/link_section.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkTreeTile extends StatelessWidget {
  const LinkTreeTile({required this.section, super.key});

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
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          const SizedBox(height: 16),
          Wrap(
            children:
                section.links
                    .map((link) => LinkTreeTileItem(link: link))
                    .toList(),
          ),
        ],
      ),
    );
  }
}

class LinkTreeTileItem extends StatelessWidget {
  const LinkTreeTileItem({required this.link, super.key});

  final Link link;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(link.url)),
      child: Tooltip(
        message: link.url,
        child: Card(
          color: const Color.fromARGB(107, 219, 203, 213),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(70),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                if (link.image != null)
                  ClipOval(
                    child: Image.network(
                      link.image!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    link.description,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 172, 122, 143),
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
