import 'package:flutter/material.dart';
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
          // TextButton.icon(
          //   onPressed: () {},
          //   icon: const Icon(Icons.settings),
          //   label: const Text(
          //     'Settings',
          //   ),
          // ),
          // TextButton.icon(
          //   onPressed: () {},
          //   icon: const Icon(UniconsLine.save),
          //   label: const Text(
          //     'Saved',
          //   ),
          // )
          TextIconButton(
            onTap: () {
              debugPrint('Drawer ontap');
            },
            title: 'Settings',
            icon: Icons.settings,
          ),
          TextIconButton(
            onTap: () {
              debugPrint('Drawer ontap');
            },
            title: 'Saved',
            icon: Icons.save,
          ),
          TextIconButton(
            onTap: () {
              debugPrint('Drawer ontap');
            },
            title: 'Your Activity',
            icon: Icons.timelapse,
          ),
          TextIconButton(
            onTap: () {
              debugPrint('Drawer ontap');
            },
            title: 'Close Friends',
            icon: Icons.person_off,
          ),
          TextIconButton(
            onTap: () {
              debugPrint('Drawer ontap');
            },
            title: 'Favorites',
            icon: Icons.star,
          )
        ],
      ),
    );
  }
}
