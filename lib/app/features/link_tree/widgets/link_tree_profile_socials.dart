import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lazu_tree/app/features/link_tree/link_tree_cubit.dart';
import 'package:lazu_tree/app/features/link_tree/models/social_link.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkTreeProfileSocials extends StatelessWidget {
  const LinkTreeProfileSocials({
    required this.color,
    super.key,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LinkTreeCubit, LinkTreeState, List<SocialLink>>(
      selector: (state) => state.user?.socialLinks ?? [],
      builder: (context, socialLinks) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children:
              socialLinks
                  .map(
                    (socialLink) => _LinkTreeProfileSocialsItem(
                      socialLink: socialLink,
                      color: color,
                      size: 32,
                    ),
                  )
                  .toList(),
        );
      },
    );
  }
}

class _LinkTreeProfileSocialsItem extends StatefulWidget {
  const _LinkTreeProfileSocialsItem({
    required this.socialLink,
    required this.color,
    this.size = 24,
  });

  final SocialLink socialLink;

  final Color color;

  final double size;

  @override
  State<_LinkTreeProfileSocialsItem> createState() =>
      _LinkTreeProfileSocialsItemState();
}

class _LinkTreeProfileSocialsItemState
    extends State<_LinkTreeProfileSocialsItem> {
  bool _isHovered = false;

  static const Map<SocialLinkType, IconData> _socialLinkIcons = {
    SocialLinkType.facebook: FontAwesomeIcons.facebook,
    SocialLinkType.instagram: FontAwesomeIcons.instagram,
    SocialLinkType.twitter: FontAwesomeIcons.twitter,
    SocialLinkType.youtube: FontAwesomeIcons.youtube,
    SocialLinkType.tiktok: FontAwesomeIcons.tiktok,
  };

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.3 : 1.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: InkWell(
          onTap: () {
            launchUrl(
              Uri.parse(widget.socialLink.url),
              webOnlyWindowName: '_blank',
            );
          },
          borderRadius: BorderRadius.circular(widget.size),
          child: Tooltip(
            message: widget.socialLink.url,
            child: Icon(
              _socialLinkIcons[widget.socialLink.type] ?? FontAwesomeIcons.link,
              size: widget.size,
              color: widget.color,
            ),
          ),
        ),
      ),
    );
  }
}
