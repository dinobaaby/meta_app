import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget msSettingActionWidget(IconData icon, String title, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.21,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          child: Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(48, 48, 49, 1.0),
                borderRadius: BorderRadius.circular(20)
            ),
            child: Icon(icon, color: Colors.white,),
          ),
        ),
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 12),)
      ],
    ),
  );
}

// Define the list of settings actions
final List<Map<String, dynamic>> listItemSettingActionWidget = [
  {'icon': Icons.phone, 'label': 'Gọi thoại'},
  {'icon': Icons.video_camera_back, 'label': 'Gọi video'},
  {'icon': Icons.person, 'label': 'Trang cá nhân'},
  {'icon': Icons.notifications_sharp, 'label': 'Tắt thông báo'},
];

// Create the listMsSettingActionWidget function
Widget listMsSettingActionWidget(List<Map<String, dynamic>> list, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: list.map((item) {
      return msSettingActionWidget(item['icon'], item['label'], context);
    }).toList(),
  );
}

final List<Map<String, dynamic>> msListItemSettingOptions = [
  {
    'icon': Icons.album_sharp,
    'label': 'Chủ đề',
    'color': const Color.fromRGBO(255, 255, 255, 1.0),
    'fc': (BuildContext context) {
      return () {
        showModalBottomSheet(context: context, builder: (BuildContext context) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
          );
        });
      };
    }
  },
  {
    'icon': Icons.thumb_up,
    'label': 'Cảm xúc nhanh',
    'color': const Color.fromRGBO(10, 148, 208, 1.0),
    'fc': (BuildContext context) {
      // Define the action for this setting
      print('Gọi video tapped');
    }
  },
  {
    'icon': Icons.text_rotation_none,
    'label': 'Biệt danh',
    'color': const Color.fromRGBO(255, 255, 255, 1.0),
    'fc': (BuildContext context) {
      // Define the action for this setting
      print('Trang cá nhân tapped');
    }
  },
  {
    'icon': Icons.edit,
    'label': 'Hiệu ứng từ ngữ',
    'color': const Color.fromRGBO(255, 255, 255, 1.0),
    'fc': (BuildContext context) {
      // Define the action for this setting
      print('Tắt thông báo tapped');
    }
  },
];

// Function to create the settings options theme widget
Widget msListSettingOptionsThemeWidget(List<Map<String, dynamic>> list, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        margin: const EdgeInsets.only(top: 30, bottom: 20),
        child: const Text(
          "Tuỳ chỉnh",
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),
      ),
      Column(
        children: list.map((item) {
          return msSettingOptionsThemeWidget(
              item['label'], item['icon'], item['color'], () => item['fc'](context));
        }).toList(),
      ),
    ],
  );
}

// Widget to represent each setting option
Widget msSettingOptionsThemeWidget(
    String title, IconData icon, Color color, Function fc) {
  return InkWell(
    onTap:() => fc(),
    child: Container(
      height: 55,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: 25,
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
