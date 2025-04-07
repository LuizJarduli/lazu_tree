import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'link_tree_state.dart';

class LinkTreeCubit extends Cubit<LinkTreeState> {
  LinkTreeCubit() : super(const LinkTreeState());

  void setIsEditing({required bool active}) {
    emit(state.copyWith(isEditing: active));
  }
}
