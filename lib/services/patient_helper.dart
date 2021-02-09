class PatientHelper {
  static String getAvatarText(String fullName) {
    String avatarInitiat;
    try {
      avatarInitiat = fullName.substring(0, 1).toUpperCase() +
          fullName.substring(fullName.indexOf(' ') + 1,
                  fullName.indexOf(' ') + 2)
              .toUpperCase();
    } catch (e) {
      avatarInitiat = 'er';
    }

    return avatarInitiat;;
  }
}
