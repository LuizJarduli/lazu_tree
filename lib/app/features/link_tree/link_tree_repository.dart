import 'package:lazu_tree/app/features/link_tree/models/link.dart';
import 'package:lazu_tree/app/features/link_tree/models/social_link.dart';
import 'package:lazu_tree/app/features/link_tree/models/user.dart';

class LinkTreeRepository {
  const LinkTreeRepository();

  Future<User> getUserTree(String userId) async {
    // TODO: use BaaS to get the user tree, see firebase or supabase
    return Future.value(
      User(
        id: userId,
        name: 'Achados da Lazu',
        email: 'achadosdalazu@gmail.com',
        phone: '+55 11 99999-9999',
        image: 'https://example.com/image.png',
        links: const [
          Link(
            id: '1',
            name: 'O MELHOR grupo VIP com cupons e promoções todos os dias',
            url: 'https://www.instagram.com/achadosdalazu',
            image: 'https://example.com/image1.png',
            containerType: LinkContainerType.tile,
          ),
        ],
        socialLinks: const [
          SocialLink(
            type: SocialLinkType.instagram,
            url: 'https://www.instagram.com/achadosdalazu',
          ),
          SocialLink(
            type: SocialLinkType.tiktok,
            url: 'https://www.tiktok.com/@achadosdalazu',
          ),
          SocialLink(
            type: SocialLinkType.youtube,
            url: 'https://www.youtube.com/@achadosdalazu',
          ),
        ],
      ),
    );
  }
}
