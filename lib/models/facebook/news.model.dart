

class NewsFacebookModel{
  final String newsId;
  final String content;
  final String userId;
  final List<String> imageUrls;
  final DateTime createdAt;
  final likes;


  const NewsFacebookModel({
      required this.newsId,
      required this.content,
      required this.userId,
      required this.imageUrls,
      required this.createdAt,
      required this.likes
  });

  Map<String, dynamic> toJson() =>{
      "newsId": newsId,
      "content": content,
      "userId": userId,
      "imageUrls": imageUrls,
      "createdAt": createdAt,
      "likes": likes
  };

}