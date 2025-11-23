class User {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String secondName;
  final String? dateBirthday;
  final String gender;
  final bool emailVisibility;
  final bool verified;

  const User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.secondName,
    this.dateBirthday,
    required this.gender,
    required this.emailVisibility,
    required this.verified,
  });

  static User fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as String,
    email: json['email'] as String? ?? '',
    firstName: json['firstname'] as String? ?? '',
    lastName: json['lastname'] as String? ?? '',
    secondName: json['secondname'] as String? ?? '',
    dateBirthday: json['datebirthday'] as String?,
    gender: json['gender'] as String? ?? '',
    emailVisibility: json['emailVisibility'] as bool? ?? false,
    verified: json['verified'] as bool? ?? false,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'firstname': firstName,
    'lastname': lastName,
    'secondname': secondName,
    'datebirthday': dateBirthday,
    'gender': gender,
    'emailVisibility': emailVisibility,
    'verified': verified,
  };
}