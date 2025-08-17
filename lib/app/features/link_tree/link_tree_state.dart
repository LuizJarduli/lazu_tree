part of 'link_tree_cubit.dart';

enum LinkTreeStatus { initial, loading, loaded, error }

@immutable
class LinkTreeState extends Equatable {
  const LinkTreeState({
    this.status = LinkTreeStatus.initial,
    this.errorMessage,
    this.additionalErrorMessage,
    this.isEditing = false,
    this.user,
  });

  final LinkTreeStatus status;

  final String? errorMessage;

  final String? additionalErrorMessage;

  final bool isEditing;

  final AppUser? user;

  @override
  List<Object?> get props => [
    status,
    errorMessage,
    additionalErrorMessage,
    isEditing,
    user,
  ];

  LinkTreeState copyWith({
    LinkTreeStatus? status,
    ValueGetter<String?>? errorMessage,
    ValueGetter<String?>? additionalErrorMessage,
    bool? isEditing,
    ValueGetter<AppUser?>? user,
  }) {
    return LinkTreeState(
      status: status ?? this.status,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
      additionalErrorMessage:
          additionalErrorMessage != null
              ? additionalErrorMessage()
              : this.additionalErrorMessage,
      user: user != null ? user() : this.user,
      isEditing: isEditing ?? this.isEditing,
    );
  }
}
