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
}
