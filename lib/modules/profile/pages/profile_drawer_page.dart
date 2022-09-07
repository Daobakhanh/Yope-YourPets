import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/blocs/app_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/app_theme/bloc/app_theme_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/app_theme/enum/app_theme_state_enum.dart';
import 'package:yope_yourpet_social_networking/modules/auth/utils/auth_show_diolog_utils.dart';
import 'package:yope_yourpet_social_networking/modules/profile/widgets/profile_personal_widget.dart';
import 'package:yope_yourpet_social_networking/modules/widget/page/widget_store_page.dart';
import 'package:yope_yourpet_social_networking/providers/bloc_provider.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';

class PersonalProfileDrawerPage extends StatefulWidget {
  const PersonalProfileDrawerPage({Key? key}) : super(key: key);

  @override
  State<PersonalProfileDrawerPage> createState() =>
      _PersonalProfileDrawerPageState();
}

class _PersonalProfileDrawerPageState extends State<PersonalProfileDrawerPage> {
  bool isSwitched = false;
  AppStateBloc appStateBloc = AppStateBloc();
  // AppThemeBloc appThemeBloc = AppThemeBloc();
  AppThemeBloc? get appThemeBloc => BlocProvider.of<AppThemeBloc>(context);
  @override
  void initState() {
    super.initState();
    // ignore: todo
    // TODO: implement initState

    asyncMethod();
  }

  void asyncMethod() async {
    bool isDarkTheme = await appThemeBloc!.readThemeStateToLocalStorageIsDark();
    setState(() {
      isSwitched = isDarkTheme;
    });
    // ....
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: appStateBloc,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Row(
              children: [
                TextIconButton(
                  onTap: () {
                    debugPrint('Drawer ontap Settings');
                    showMyDialog(context);
                  },
                  title: 'Brightness',
                  icon: isSwitched ? Icons.dark_mode : Icons.sunny,
                ),
                Switch(
                  value: isSwitched,
                  onChanged: (value) async {
                    setState(() {
                      isSwitched = value;
                      debugPrint('$isSwitched');
                    });
                    await appThemeBloc!.changeAppThemeState(value);
                    await appThemeBloc!.saveThemeStateToLocalStorage(
                      value ? AppThemeStateEnum.dark : AppThemeStateEnum.light,
                    );
                  },
                  activeTrackColor: AppColor.light,
                  activeColor: AppColor.pinkAccent,
                ),
              ],
            ),
            TextIconButton(
              onTap: () {
                debugPrint('Drawer ontap widget store');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const WidgetStorePage()),
                  ),
                );
                // showMyDialog(context);
              },
              title: 'Widget store',
              icon: Icons.store,
            ),
            TextIconButton(
              onTap: () {
                debugPrint('Drawer ontap Settings');
                showMyDialog(context);
              },
              title: 'Settings',
              icon: Icons.settings,
            ),
            TextIconButton(
              onTap: () {
                debugPrint('Drawer ontap save');
                showMyDialog(context);
              },
              title: 'Saved',
              icon: Icons.save,
            ),
            TextIconButton(
              onTap: () {
                debugPrint('Drawer ontap Activity');
                showMyDialog(context);
              },
              title: 'Your Activity',
              icon: Icons.timelapse,
            ),
            TextIconButton(
              onTap: () {
                debugPrint('Drawer ontap Close Friends');
                showMyDialog(context);
              },
              title: 'Close Friends',
              icon: Icons.person_off,
            ),
            TextIconButton(
              onTap: () {
                debugPrint('Drawer ontap Favorites');
                showMyDialog(context);
              },
              title: 'Favorites',
              icon: Icons.star,
            ),
            TextIconButton(
              onTap: () {
                debugPrint('Drawer ontap Logout');

                // showMyDialog(context);
                appStateBloc.logout();
                logOutShowMyDialog(context);
              },
              title: 'Logout',
              icon: Icons.logout,
            )
          ],
        ),
      ),
    );
  }
}
