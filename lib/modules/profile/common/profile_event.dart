enum ProfileEvent { getPersonalProfile, getUserDetailById }

class ProfileEventMap {
  final String userId;
  final ProfileEvent event;
  ProfileEventMap({required this.userId, required this.event});
}
