import 'dart:async';

import 'package:yope_yourpet_social_networking/providers/bloc_provider.dart';

enum AppState { loading, unAuthorized, authorized }

class AppStateBloc implements BlocBase {
  StreamController<AppState> streamController = StreamController<AppState>();
  Stream<AppState> get appStateStream => streamController.stream;

  //initial state
  AppState get initState => AppState.loading;

  @override
  void dispose() {
    streamController.close();
  }
}
