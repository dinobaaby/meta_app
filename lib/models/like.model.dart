class LikeModel {
  String likeId;
  String postId;
  String userId;

  LikeModel({
    required this.likeId,
    required this.postId,
    required this.userId,
  });

  factory LikeModel.fromMap(Map<String, dynamic> data) {
    return LikeModel(
      likeId: data['likeId'],
      postId: data['postId'],
      userId: data['userId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'likeId': likeId,
      'postId': postId,
      'userId': userId,
    };
  }
}
