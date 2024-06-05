class CommentModel {
  String commentId;
  String postId;
  String userId;
  String content;
  DateTime timestamp;

  CommentModel({
    required this.commentId,
    required this.postId,
    required this.userId,
    required this.content,
    required this.timestamp,
  });

  factory CommentModel.fromMap(Map<String, dynamic> data) {
    return CommentModel(
      commentId: data['commentId'],
      postId: data['postId'],
      userId: data['userId'],
      content: data['content'],
      timestamp: DateTime.parse(data['timestamp']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'commentId': commentId,
      'postId': postId,
      'userId': userId,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
