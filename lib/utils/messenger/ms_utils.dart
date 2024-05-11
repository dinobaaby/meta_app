import 'package:meta_app/screens/messenger/ms_home_screen.dart';
import 'package:meta_app/screens/messenger/ms_people_screen.dart';
import 'package:meta_app/screens/messenger/ms_stories_screen.dart';

final ms_home_screen_items = [
  const MessengerHomeScreen(),
  const MessengerPeopleScreen(),
  const MessengerStoriesScreen()
];


bool isImage(String content){
  final imagePatten = r".+\.(jpg|jpeg|png|gif)";
  if(content.startsWith("http") || content.startsWith("https")){
    return RegExp(imagePatten).matchAsPrefix(content) != null;
  }
  return RegExp(imagePatten).matchAsPrefix(content) != null;
}
