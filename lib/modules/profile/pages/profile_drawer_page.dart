import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/auth/utils/auth_show_diolog_utils.dart';
import 'package:yope_yourpet_social_networking/modules/profile/widgets/personal_profile_widget.dart';

class PersonalProfileDrawerPage extends StatefulWidget {
  const PersonalProfileDrawerPage({Key? key}) : super(key: key);

  @override
  State<PersonalProfileDrawerPage> createState() =>
      _PersonalProfileDrawerPageState();
}

class _PersonalProfileDrawerPageState extends State<PersonalProfileDrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
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
              debugPrint('Drawer ontap Settings');
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
              showMyDialog(context);
            },
            title: 'Logout',
            icon: Icons.logout,
          )
        ],
      ),
    );
  }
}
