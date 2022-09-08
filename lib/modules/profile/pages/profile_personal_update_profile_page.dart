import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/common/api/public.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/profile/blocs/profile_infor_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/profile/blocs/profile_update_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/profile/common/profile_data_update.dart';
import 'package:yope_yourpet_social_networking/modules/profile/common/profile_event.dart';
import 'package:yope_yourpet_social_networking/modules/profile/pages/profile_personal_page.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

class ProfilePersonalEditPage extends StatefulWidget {
  final User? user;
  const ProfilePersonalEditPage({Key? key, this.user}) : super(key: key);

  @override
  State<ProfilePersonalEditPage> createState() =>
      _ProfilePersonalEditPageState();
}

class _ProfilePersonalEditPageState extends State<ProfilePersonalEditPage> {
  User get user => widget.user!;
  final ProfileBloc _profileBloc = ProfileBloc();
  late String fisrtName = '';
  late String lastName = '';
  late String bio = '';
  late TextEditingController _controllerTextFisrtname;
  late TextEditingController _controllerTextLastname;
  late TextEditingController _controllerTextBio;

  initialValueTextInput(val) {
    return TextEditingController(text: val);
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    fisrtName = user.firstName!;
    lastName = user.lastName!;
    bio = user.profile!.bio!;
    _controllerTextFisrtname = TextEditingController(text: user.firstName!);
    _controllerTextLastname = TextEditingController(text: user.lastName!);
    _controllerTextBio = TextEditingController(text: user.profile!.bio!);

    _profileBloc.add(
      ProfileEvent(
          userId: personalId, event: ProfileEventEnum.getPersonalProfile),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              // debugPrint('Tap edit "done"');
              _handleUpdatePersonalProfile(fisrtName, lastName, bio);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProfilePersonalPage()),
              );
            },
            child: Text(
              'Done',
              style: AppTextStyle.body17.copyWith(
                color: AppColor.activeStateBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        title: const Text('Edit profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const SizeBox20H(),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: SizedBox(
                  // ignore: unnecessary_null_in_if_null_operators
                  height: 50,
                  child: TextField(
                    autofocus: false,
                    controller: _controllerTextFisrtname,
                    onChanged: (String contentValue) {
                      fisrtName = contentValue;
                      debugPrint(fisrtName);
                    },
                    decoration: InputDecoration(
                      labelText: 'First name',
                      suffixIcon: IconButton(
                        onPressed: _controllerTextFisrtname.clear,
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: SizedBox(
                  // ignore: unnecessary_null_in_if_null_operators
                  height: 50,
                  child: TextField(
                    autofocus: false,
                    controller: _controllerTextLastname,
                    onChanged: (String contentValue) {
                      lastName = contentValue;
                      debugPrint(lastName);
                      // widget.onSubmitContent!(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Last name',
                      suffixIcon: IconButton(
                        onPressed: _controllerTextLastname.clear,
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: SizedBox(
                  // ignore: unnecessary_null_in_if_null_operators
                  // height: 50,
                  child: TextField(
                    maxLines: 5,
                    minLines: 1,
                    autofocus: false,
                    controller: _controllerTextBio,
                    onChanged: (String contentValue) {
                      bio = contentValue;
                      debugPrint(bio);
                    },
                    decoration: InputDecoration(
                      labelText: 'Bio',
                      suffixIcon: IconButton(
                        onPressed: _controllerTextBio.clear,
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _handleUpdatePersonalProfile(
      String firstName, String lastName, String bio) async {
    await ProfileUpdateBloc.updateProfileEvent(
        DataUpdateProfile(firstName, lastName, bio));
  }
}
