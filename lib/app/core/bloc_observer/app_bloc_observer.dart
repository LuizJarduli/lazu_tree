import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazu_tree/app/core/logger/logger.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver(this._logger);

  final Logger _logger;

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      _logger.debug('onChange: $bloc, $change');
    }
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      _logger.debug('onTransition: $bloc, $transition');
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    _logger.error('onError: $bloc, $error, $stackTrace');
  }
}
