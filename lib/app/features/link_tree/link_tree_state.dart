part of 'link_tree_cubit.dart';

enum LinkTreeStatus { initial, loading, loaded, error }

@immutable
class LinkTreeState extends Equatable {
  const LinkTreeState({
    this.status = LinkTreeStatus.initial,
    this.errorMessage,
    this.additionalErrorMessage,
    this.isEditing = false,
    this.links = const [],
  });

  final LinkTreeStatus status;

  final String? errorMessage;

  final String? additionalErrorMessage;

  final bool isEditing;

  final List<String> links;

  @override
  List<Object?> get props => [
    status,
    errorMessage,
    additionalErrorMessage,
    isEditing,
    links,
  ];

  LinkTreeState copyWith({
    LinkTreeStatus? status,
    ValueGetter<String?>? errorMessage,
    ValueGetter<String?>? additionalErrorMessage,
    bool? isEditing,
    List<String>? links,
  }) {
    return LinkTreeState(
      status: status ?? this.status,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
      additionalErrorMessage:
          additionalErrorMessage != null
              ? additionalErrorMessage()
              : this.additionalErrorMessage,
      links: links ?? this.links,
      isEditing: isEditing ?? this.isEditing,
    );
  }
}
