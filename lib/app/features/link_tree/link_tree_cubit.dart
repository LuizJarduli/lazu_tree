import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazu_tree/app/core/logger/logger.dart';
import 'package:lazu_tree/app/features/link_tree/link_tree_repository.dart';
import 'package:lazu_tree/app/features/link_tree/models/user.dart';

part 'link_tree_state.dart';

class LinkTreeCubit extends Cubit<LinkTreeState> {
  LinkTreeCubit(this._repository, this._logger) : super(const LinkTreeState());

  final LinkTreeRepository _repository;

  final Logger _logger;

  void setIsEditing({required bool active}) {
    emit(state.copyWith(isEditing: active));
  }

  Future<void> getUserTree() async {
    emit(state.copyWith(status: LinkTreeStatus.loading));

    try {
      final user = await _repository.getUserTree('1A');

      emit(state.copyWith(status: LinkTreeStatus.loaded, user: () => user));
    } on Exception catch (error, stackTrace) {
      _logger.error('Error getting user tree', error, stackTrace);

      emit(
        state.copyWith(
          status: LinkTreeStatus.error,
          errorMessage: error.toString,
          additionalErrorMessage: stackTrace.toString,
        ),
      );
    }
  }
}
