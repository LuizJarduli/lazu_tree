import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

enum LinkContainerType {
  tile,
  card;

  static LinkContainerType fromString(String value) {
    return LinkContainerType.values.byName(value);
  }
}

@immutable
class Link extends Equatable {
  const Link({
    required this.id,
    required this.name,
    required this.url,
    required this.image,
    required this.containerType,
  });

  final String id;

  final String name;

  final String url;

  final String? image;

  final LinkContainerType containerType;

  @override
  List<Object?> get props => [id, name, url, image, containerType];

  Link copyWith({
    String? id,
    String? name,
    String? url,
    ValueGetter<String?>? image,
    LinkContainerType? containerType,
  }) {
    return Link(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      image: image != null ? image() : this.image,
      containerType: containerType ?? this.containerType,
    );
  }
}
