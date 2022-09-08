import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/profile/common/profile_data_update.dart';
import 'package:yope_yourpet_social_networking/modules/profile/repos/profile_personal_update_repo.dart';

class ProfileUpdateBloc extends BlocBase {
  // final String event;

  ProfileUpdateBloc(state) : super(state);

  static Future<bool> updateProfileEvent(DataUpdateProfile? dataUserUpdate) =>
      ProfileUpdateRepo.submitProfileDataUpdate(dataUserUpdate);
}
