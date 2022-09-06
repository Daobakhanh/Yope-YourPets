import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yope_yourpet_social_networking/modules/profile/repos/personal_profile_repo.dart';
import 'package:yope_yourpet_social_networking/providers/bloc_provider.dart';

enum AppState { loading, unAuthorized, authorized }

class AppStateBloc implements BlocBase {
  //create Stream controler
  StreamController<AppState> appStateStreamController =
      StreamController<AppState>();

  Stream<AppState> get appStateStream => appStateStreamController.stream;

  //initial state
  AppState get initState => AppState.loading;

  @override
  void dispose() {
    appStateStreamController.close();
  }

  AppStateBloc() {
    launchApp();
  }

  Future<void> launchApp() async {
    final resUserTokenActive =
        await PersonalProfileRepo().getStatusUserTokenUsingPersonalProfileAPi();
    await changeAppState(resUserTokenActive);
  }

  Future<void> changeAppState(bool userTokenActive) async {
    // final storePref = await SharedPreferences.getInstance();

    if (userTokenActive) {
      appStateStreamController.sink.add(AppState.authorized);
    } else {
      appStateStreamController.sink.add(AppState.unAuthorized);
    }
    // storePref.;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();

    await changeAppState(false);

    // debugPrint(AppState)
  }
}
