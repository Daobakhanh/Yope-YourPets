import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/profile/pages/profile_drawer_page.dart';
import 'package:yope_yourpet_social_networking/modules/profile/repos/profile_repo.dart';

class PersonalProfile extends StatefulWidget {
  const PersonalProfile({Key? key}) : super(key: key);

  @override
  State<PersonalProfile> createState() => _PersonalProfileState();
}

class _PersonalProfileState extends State<PersonalProfile> {
  late Future<Users> users;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    users = readJsonFromAssetUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(child: PersonalProfileDrawerPage()),
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('My Profile'),
      ),
      body: const Text('Profile Coming soon'),
    );
  }
}
