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
}
