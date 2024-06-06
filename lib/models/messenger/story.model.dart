import 'package:cloud_firestore/cloud_firestore.dart';

class Story {
  final String id;
  final String imageUrl;
  final String authorName;
  final String authorImageUrl;
  final int storyCount;

  Story({
    required this.id,
    required this.imageUrl,
    required this.authorName,
    required this.authorImageUrl,
    required this.storyCount,
  });

  // Method to create a Story from a Firestore document snapshot
  factory Story.fromSnap(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;
    return Story(
      id: snap.id,
      imageUrl: data['imageUrl'],
      authorName: data['authorName'],
      authorImageUrl: data['authorImageUrl'],
      storyCount: data['storyCount'],
    );
  }

  // Method to convert a Story to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'authorName': authorName,
      'authorImageUrl': authorImageUrl,
      'storyCount': storyCount,
    };
  }
}
Future<List<Story>> fetchStories() async {
  List<Story> stories = [];
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('stories')
        .get();

    for (var doc in querySnapshot.docs) {
      stories.add(Story.fromSnap(doc));
    }
  } catch (e) {
    print("Error fetching stories: $e");
  }
  return stories;
}
