import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  // @override
  // void onEvent(Bloc bloc, Object event) {
  //   print(event);
  //   super.onEvent(bloc, event);
  // }



  @override
  void onChange(BlocBase bloc, Change change) {
      print(change);
      super.onChange(bloc, change);
  } // @override
  // void onChange(Cubit cubit, Change change) {
  //   print(change);
  //   super.onChange(cubit, change);
  // }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
      print('$error, $stackTrace');
      super.onError(bloc, error, stackTrace);
  }


// @override
  // void onError(Cubit cubit, Object error, StackTrace stackTrace) {
  //   print('$error, $stackTrace');
  //   super.onError(cubit, error, stackTrace);
  // }
}
