



class NewsFacebookModel{
  final String newsId;
  final String content;
  final String userId;
  final List<String> imageUrls;
  final DateTime createdAt;
  final String profileImg;
  final String userName;
  final likes;


  const NewsFacebookModel({
      required this.newsId,
      required this.content,
      required this.userId,
      required this.imageUrls,
      required this.createdAt,
      required this.profileImg,
      required this.userName,
      required this.likes
  });

  Map<String, dynamic> toJson() =>{
      "newsId": newsId,
      "content": content,
      "userId": userId,
      "imageUrls": imageUrls,
      "createdAt": createdAt,
      "profileImg": profileImg,
      "userName": userName,
      "likes": likes
  };




}