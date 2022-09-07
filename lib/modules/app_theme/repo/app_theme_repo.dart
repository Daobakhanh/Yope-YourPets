import 'package:shared_preferences/shared_preferences.dart';
import 'package:yope_yourpet_social_networking/modules/app_theme/enum/app_theme_state_enum.dart';
import 'package:yope_yourpet_social_networking/utils/prefs_key.dart';

class AppThemeRepo {
  static Future<void> saveThemeStateToLocalStorage(
      AppThemeStateEnum appThemeState) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(PrefsKey.appThemeMode, appThemeState.toString());
  }

  static Future<AppThemeStateEnum?> readThemeStateToLocalStorage() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    String appThemeModeRead = prefs.getString(PrefsKey.appThemeMode) ?? '';
    // debugPrint(
    //   'Service: Read user token from local str: $userTokenRead',
    // );
    if (appThemeModeRead == AppThemeStateEnum.dark.toString()) {
      return AppThemeStateEnum.dark;
    }
    return AppThemeStateEnum.light;
  }
}
