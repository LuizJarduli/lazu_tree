import 'package:lazu_tree/app/features/link_tree/models/link.dart';
import 'package:lazu_tree/app/features/link_tree/models/link_section.dart';
import 'package:lazu_tree/app/features/link_tree/models/social_link.dart';
import 'package:lazu_tree/app/features/link_tree/models/user.dart';

class LinkTreeRepository {
  const LinkTreeRepository();

  Future<User> getUserTree(String userId) async {
    // ? TODO(lugalokinho): use BaaS to get the user tree,
    // ? see firebase or supabase
    return Future.value(
      User(
        id: userId,
        name: 'Achados da Lazu',
        email: 'achadosdalazu@gmail.com',
        phone: '+55 11 99999-9999',
        image: 'https://example.com/image.png',
        linkSections: const [
          LinkSection(
            id: '1',
            links: [
              Link(
                id: '1',
                description:
                    'O MELHOR grupo VIP com cupons e promoções todos os dias',
                url: 'https://www.instagram.com/achadosdalazu',
                image: 'https://placehold.co/60x60@2x.png?text=Link%20img',
              ),
              Link(
                id: '2',
                description: 'Grupo VIP apenas de CUPONS de desconto!',
                url: 'https://www.instagram.com/achadosdalazu',
                image: 'https://placehold.co/60x60@2x.png?text=Link%20img',
              ),
            ],
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
