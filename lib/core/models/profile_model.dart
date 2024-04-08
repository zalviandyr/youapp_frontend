class ProfileModel {
  final String? name;
  final String? gender;
  final String? birthday;
  final String? horoscope;
  final String? zodiac;
  final String? profilePicture;
  final int? height;
  final int? weight;
  final List<String>? interests;

  ProfileModel({
    required this.name,
    required this.gender,
    required this.birthday,
    required this.horoscope,
    required this.zodiac,
    required this.profilePicture,
    required this.height,
    required this.weight,
    required this.interests,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'gender': gender,
      'birthday': birthday,
      'horoscope': horoscope,
      'zodiac': zodiac,
      'profilePicture': profilePicture,
      'height': height,
      'weight': weight,
      'interests': interests,
    };
  }
}
