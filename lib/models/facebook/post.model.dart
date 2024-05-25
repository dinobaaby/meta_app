import 'package:faker/faker.dart';

class PostFacebookModel {
  final String postId;
  final String content;
  final String userId;
  final List<String> imageUrls;
  final DateTime createdAt;
  final String profileImg;
  final String userName;
  final int likes;

  const PostFacebookModel({
    required this.postId,
    required this.content,
    required this.userId,
    required this.imageUrls,
    required this.createdAt,
    required this.profileImg,
    required this.userName,
    required this.likes,
  });

  Map<String, dynamic> toJson() => {
    "postId": postId,
    "content": content,
    "userId": userId,
    "imageUrls": imageUrls,
    "createdAt": createdAt.toIso8601String(),
    "profileImg": profileImg,
    "userName": userName,
    "likes": likes,
  };

  factory PostFacebookModel.fromJson(Map<String, dynamic> json) {
    return PostFacebookModel(
      postId: json['postId'],
      content: json['content'],
      userId: json['userId'],
      imageUrls: List<String>.from(json['imageUrls']),
      createdAt: DateTime.parse(json['createdAt']),
      profileImg: json['profileImg'],
      userName: json['userName'],
      likes: json['likes'],
    );
  }
}


final faker = Faker();

final posts = List.generate(10, (index) => PostFacebookModel(
  postId: faker.guid.guid(),
  content: faker.lorem.sentence(),
  userId: faker.guid.guid(),
  imageUrls: List.generate(5, (_) => faker.image.image()),
  createdAt: faker.date.dateTime(),
  profileImg: faker.image.image(),
  userName: faker.person.firstName(),
  likes: faker.randomGenerator.integer(1000, min: 1),
));