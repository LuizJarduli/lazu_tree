import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
class Link extends Equatable {
  const Link({
    required this.id,
    required this.description,
    required this.url,
    required this.image,
  });

  factory Link.fromMap(Map<String, dynamic> map) {
    return Link(
      id: map['id'] as String,
      description: map['description'] as String,
      url: map['url'] as String,
      image: map['image'] as String?,
    );
  }

  factory Link.fromJson(String source) =>
      Link.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;

  final String description;

  final String url;

  final String? image;

  @override
  List<Object?> get props => [id, description, url, image];

  Link copyWith({
    String? id,
    String? description,
    String? url,
    ValueGetter<String?>? image,
  }) {
    return Link(
      id: id ?? this.id,
      description: description ?? this.description,
      url: url ?? this.url,
      image: image != null ? image() : this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'url': url,
      'image': image,
    };
  }

  String toJson() => json.encode(toMap());
}
