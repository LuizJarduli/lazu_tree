import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lazu_tree/app/features/link_tree/models/link.dart';

enum LinkContainerType {
  tile,
  card;

  static LinkContainerType fromString(String value) {
    return LinkContainerType.values.byName(value);
  }

  bool get isTile => this == LinkContainerType.tile;

  bool get isCard => this == LinkContainerType.card;
}

@immutable
class LinkSection extends Equatable {
  const LinkSection({
    required this.id,
    required this.links,
    this.title,
    this.containerType = LinkContainerType.tile,
  });

  factory LinkSection.fromMap(Map<String, dynamic> map) {
    return LinkSection(
      id: map['id'] as String,
      links: List<Link>.from(
        (map['links'] as List?)?.map(
              (x) => Link.fromMap(x as Map<String, dynamic>),
            ) ??
            const [],
      ),
      title: map['title'] as String?,
      containerType:
          map['containerType'] != null
              ? LinkContainerType.fromString(map['containerType'] as String)
              : LinkContainerType.tile,
    );
  }

  factory LinkSection.fromJson(String source) =>
      LinkSection.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;

  final List<Link> links;

  final String? title;

  final LinkContainerType containerType;

  @override
  List<Object?> get props => [id, links, title, containerType];

  LinkSection copyWith({
    String? id,
    List<Link>? links,
    String? title,
    LinkContainerType? containerType,
  }) {
    return LinkSection(
      id: id ?? this.id,
      links: links ?? this.links,
      title: title ?? this.title,
      containerType: containerType ?? this.containerType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'links': links.map((x) => x.toMap()).toList(),
      'title': title,
      'containerType': containerType.name,
    };
  }

  String toJson() => json.encode(toMap());
}
