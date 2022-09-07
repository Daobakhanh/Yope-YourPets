import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yope_yourpet_social_networking/modules/profile/repos/profile_infor_repo.dart';
import 'package:yope_yourpet_social_networking/providers/bloc_provider.dart';
import 'package:yope_yourpet_social_networking/utils/prefs_key.dart';

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
    final isUserTokenActive =
        await PersonalProfileRepo().getStatusUserTokenUsingPersonalProfileAPi();
    await changeAppState(isUserTokenActive);
  }

  Future<void> changeAppState(bool isUserTokenActive) async {
    // final storePref = await SharedPreferences.getInstance();

    if (isUserTokenActive) {
      appStateStreamController.sink.add(AppState.authorized);
    } else {
      appStateStreamController.sink.add(AppState.unAuthorized);
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    // await prefs.clear();
    await prefs.remove(PrefsKey.userToken);

    await changeAppState(false);

    // debugPrint(AppState)
  }
}
