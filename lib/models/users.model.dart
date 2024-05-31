class User{
  final String uid;
  final String name;
  final String email;
  final String password;
  final DateTime birthDate;
  final String avatarUrl;

  User({
    required this.uid,
    required this.name,
    required this.email,
    required this.password,
    required this.birthDate,
    required this.avatarUrl
  });

Map<String, dynamic> toJson() => {
    "uid": uid,
    "name": name,
    "email": email,
    "password": password,
    "birthDate": birthDate.toIso8601String(),
    "avatarUrl": avatarUrl
  };

static User fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      birthDate: DateTime.parse(json['birthDate']),
      avatarUrl: json['avatarUrl']
    );
  }
}

