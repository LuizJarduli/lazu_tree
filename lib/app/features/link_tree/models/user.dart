import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:lazu_tree/app/features/link_tree/models/link.dart';
import 'package:lazu_tree/app/features/link_tree/models/social_link.dart';

@immutable
class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.links,
    required this.socialLinks,
  });

  final String id;

  final String name;

  final String email;

  final String phone;

  final String image;

  final List<Link> links;

  final List<SocialLink> socialLinks;

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    phone,
    image,
    links,
    socialLinks,
  ];

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? image,
    List<Link>? links,
    List<SocialLink>? socialLinks,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      links: links ?? this.links,
      socialLinks: socialLinks ?? this.socialLinks,
    );
  }
}
