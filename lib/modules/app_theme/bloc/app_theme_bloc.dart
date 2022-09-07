import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yope_yourpet_social_networking/modules/app_theme/enum/app_theme_state_enum.dart';
import 'package:yope_yourpet_social_networking/providers/bloc_provider.dart';
import 'package:yope_yourpet_social_networking/utils/prefs_key.dart';

class AppThemeBloc implements BlocBase {
  StreamController<AppThemeStateEnum> appThemeStateStreamControler =
      StreamController();
  Stream<AppThemeStateEnum> get stream => appThemeStateStreamControler.stream;

  AppThemeStateEnum get initialThemeState => AppThemeStateEnum.light;

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    // appThemeStateStreamControler.close();
  }

  AppThemeBloc() {
    readThemeStateToLocalStorageIsDark();
  }

  Future<void> saveThemeStateToLocalStorage(
      AppThemeStateEnum appThemeState) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(PrefsKey.appThemeMode, appThemeState.toString());
  }

  Future<bool> readThemeStateToLocalStorageIsDark() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    String appThemeModeRead = prefs.getString(PrefsKey.appThemeMode) ?? '';

    if (appThemeModeRead == AppThemeStateEnum.dark.toString()) {
      appThemeStateStreamControler.sink.add(AppThemeStateEnum.dark);
      return true;
    } else if (appThemeModeRead == AppThemeStateEnum.light.toString()) {
      appThemeStateStreamControler.sink.add(AppThemeStateEnum.light);
      return false;
    }

    return false;
  }

  Future<void> changeAppThemeState(bool isDarkTheme) async {
    debugPrint('Theme select mode: $isDarkTheme');
    if (isDarkTheme) {
      appThemeStateStreamControler.sink.add(AppThemeStateEnum.dark);
      await saveThemeStateToLocalStorage(AppThemeStateEnum.dark);
    } else {
      appThemeStateStreamControler.sink.add(AppThemeStateEnum.light);
      await saveThemeStateToLocalStorage(AppThemeStateEnum.light);
    }
  }
}
