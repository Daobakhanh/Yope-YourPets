import 'package:yope_yourpet_social_networking/modules/auth/repo/auth_login_dofhunt_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final personalId = dotenv.env["PERSONALID"];

String avtBlank =
    "https://st.depositphotos.com/1779253/5140/v/380/depositphotos_51405259-stock-illustration-male-avatar-profile-picture-use.jpg?forcejpeg=true";

Future<String?> getUserTokenFromLocalStorage() async {
  final String userTokenRead =
      await LoginWithDofhuntAPI.readUserTokenToLocalStorage() ?? '';
  return userTokenRead;
}

Future<String?> getAPI() async {
  await dotenv.load(fileName: ".env");
  String? api = dotenv.env['API'];
  return api;
}

Future<String?> getDofhuntUserId() async {
  await dotenv.load(fileName: ".env");
  String? dofhuntUserId = dotenv.env['DOFHUNTID'];
  return dofhuntUserId;
}
