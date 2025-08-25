import 'package:lazu_tree/app/features/link_tree/models/app_user.dart';
import 'package:lazu_tree/app/features/link_tree/models/link.dart';
import 'package:lazu_tree/app/features/link_tree/models/link_section.dart';
import 'package:lazu_tree/app/features/link_tree/models/social_link.dart';

class LinkTreeRepository {
  const LinkTreeRepository();

  Future<AppUser> getUserTree(String username) async {
    // ? TODO(lugalokinho): use BaaS to get the user tree,
    // ? see firebase or supabase
    return Future.value(
      AppUser(
        id: '1',
        username: username,
        name: 'Achados da Lazu',
        email: 'achadosdalazu@gmail.com',
        phone: '+55 11 99999-9999',
        image:
            'https://images.pexels.com/photos/264905/pexels-photo-264905.jpeg?_gl=1*p4rr2h*_ga*NDYzNTYxNTA5LjE3NTI5NzQ2MDY.*_ga_8JE65Q40S6*czE3NTI5NzQ2MDUkbzEkZzEkdDE3NTI5NzQ2NDAkajI1JGwwJGgw',
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
          LinkSection(
            id: '2',
            containerType: LinkContainerType.card,
            title: 'Amazon \uD83D\uDE80',
            links: [
              Link(
                id: '3',
                description:
                    'O MELHOR grupo VIP com cupons e promoções todos os dias',
                url: 'https://www.instagram.com/achadosdalazu',
                image: 'https://placehold.co/160x90@2x.png?text=Link%20img',
              ),
              Link(
                id: '4',
                description:
                    'O MELHOR grupo VIP com cupons e promoções todos os dias',
                url: 'https://www.instagram.com/achadosdalazu',
                image: 'https://placehold.co/160x90@2x.png?text=Link%20img',
              ),
              Link(
                id: '5',
                description:
                    'O MELHOR grupo VIP com cupons e promoções todos os dias',
                url: 'https://www.instagram.com/achadosdalazu',
                image: 'https://placehold.co/160x90@2x.png?text=Link%20img',
              ),
              Link(
                id: '6',
                description:
                    'O MELHOR grupo VIP com cupons e promoções todos os dias',
                url: 'https://www.instagram.com/achadosdalazu',
                image: 'https://placehold.co/160x90@2x.png?text=Link%20img',
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
