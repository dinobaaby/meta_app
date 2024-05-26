import 'dart:math';

import 'package:faker/faker.dart';

class VideoFacebookModel {
  final String videoId;
  final String content;
  final String userId;
  final String videoUrl;
  final DateTime createdAt;
  final String profileImg;
  final String userName;
  final int likes;

  const VideoFacebookModel({
    required this.videoId,
    required this.content,
    required this.userId,
    required this.videoUrl,
    required this.createdAt,
    required this.profileImg,
    required this.userName,
    required this.likes,
  });

  Map<String, dynamic> toJson() => {
        "videoId": videoId,
        "content": content,
        "userId": userId,
        "videoUrl": videoUrl,
        "createdAt": createdAt.toIso8601String(),
        "profileImg": profileImg,
        "userName": userName,
        "likes": likes,
      };

  factory VideoFacebookModel.fromJson(Map<String, dynamic> json) {
    return VideoFacebookModel(
      videoId: json['videoId'],
      content: json['content'],
      userId: json['userId'],
      videoUrl: json['videoUrl'],
      createdAt: DateTime.parse(json['createdAt']),
      profileImg: json['profileImg'],
      userName: json['userName'],
      likes: json['likes'],
    );
  }
}

final faker = Faker();

final videos = List.generate(
    10,
    (index) => VideoFacebookModel(
          videoId: faker.guid.guid(),
          content: faker.lorem.sentence(),
          userId: faker.guid.guid(),
          videoUrl:
              'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
          // chưa biết generate videoUrl như nào =)))
          createdAt: faker.date.dateTime(),
          profileImg: faker.image.image(),
          userName: faker.person.firstName(),
          likes: faker.randomGenerator.integer(1000, min: 1),
        ));
