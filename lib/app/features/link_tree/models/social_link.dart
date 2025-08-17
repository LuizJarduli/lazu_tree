import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

enum SocialLinkType {
  instagram,
  facebook,
  twitter,
  youtube,
  tiktok,
  linkedin,
  pinterest,
  telegram,
  twitch,
  discord,
  reddit;

  static SocialLinkType fromString(String value) {
    return SocialLinkType.values.byName(value);
  }
}

@immutable
class SocialLink extends Equatable {
  const SocialLink({required this.type, required this.url});

  factory SocialLink.fromMap(Map<String, dynamic> map) {
    return SocialLink(
      type: SocialLinkType.fromString(map['type'] as String),
      url: map['url'] as String,
    );
  }

  factory SocialLink.fromJson(String source) =>
      SocialLink.fromMap(json.decode(source) as Map<String, dynamic>);

  final SocialLinkType type;

  final String url;

  @override
  List<Object?> get props => [type, url];

  SocialLink copyWith({SocialLinkType? type, String? url}) {
    return SocialLink(type: type ?? this.type, url: url ?? this.url);
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type.name,
      'url': url,
    };
  }

  String toJson() => json.encode(toMap());
}
