class PostModel {
  String postId;
  String userId;
  String content;
  String imageUrl;
  DateTime timestamp;
  List<String> likes;
  List<String> comments;

  PostModel({
    required this.postId,
    required this.userId,
    required this.content,
    required this.imageUrl,
    required this.timestamp,
    required this.likes,
    required this.comments,
  });

  factory PostModel.fromMap(Map<String, dynamic> data) {
    return PostModel(
      postId: data['postId'],
      userId: data['userId'],
      content: data['content'],
      imageUrl: data['imageUrl'],
      timestamp: DateTime.parse(data['timestamp']),
      likes: List<String>.from(data['likes']),
      comments: List<String>.from(data['comments']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'userId': userId,
      'content': content,
      'imageUrl': imageUrl,
      'timestamp': timestamp.toIso8601String(),
      'likes': likes,
      'comments': comments,
    };
  }
}
