import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:lazu_tree/app/features/link_tree/models/link_section.dart';
import 'package:lazu_tree/app/features/link_tree/models/social_link.dart';

@immutable
class AppUser extends Equatable {
  const AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.linkSections,
    required this.socialLinks,
    this.image,
    this.phone,
  });

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String?,
      image: map['image'] as String?,
      linkSections: List<LinkSection>.from(
        (map['linkSections'] as List?)?.map(
              (x) => LinkSection.fromMap(x as Map<String, dynamic>),
            ) ??
            const [],
      ),
      socialLinks: List<SocialLink>.from(
        (map['socialLinks'] as List?)?.map(
              (x) => SocialLink.fromMap(x as Map<String, dynamic>),
            ) ??
            const [],
      ),
    );
  }

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;

  final String name;

  final String email;

  final String? phone;

  final String? image;

  final List<LinkSection> linkSections;

  final List<SocialLink> socialLinks;

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    phone,
    image,
    linkSections,
    socialLinks,
  ];

  AppUser copyWith({
    String? id,
    String? name,
    String? email,
    ValueGetter<String>? phone,
    ValueGetter<String>? image,
    List<LinkSection>? linkSections,
    List<SocialLink>? socialLinks,
  }) {
    return AppUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone != null ? phone() : this.phone,
      image: image != null ? image() : this.image,
      linkSections: linkSections ?? this.linkSections,
      socialLinks: socialLinks ?? this.socialLinks,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'linkSections': linkSections.map((x) => x.toMap()).toList(),
      'socialLinks': socialLinks.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}
