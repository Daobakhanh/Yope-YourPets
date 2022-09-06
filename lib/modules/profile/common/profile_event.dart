enum ProfileEventEnum {
  getPersonalProfile,
  getUserDetailById,
  getListFollower,
  getListFollowing
}

class ProfileEvent {
  final String userId;
  final ProfileEventEnum event;

  String get getUserId {
    return userId;
  }

  ProfileEventEnum get getProfileEvent {
    return event;
  }

  ProfileEvent({required this.userId, required this.event});
}
