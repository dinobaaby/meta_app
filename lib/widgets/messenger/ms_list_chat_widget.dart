import 'package:flutter/material.dart';
import 'package:meta_app/screens/messenger/ms_chat_screen.dart';
import 'package:meta_app/widgets/messenger/ms_chat_widget.dart';

class MessengerListChatWidget extends StatefulWidget {
  const MessengerListChatWidget({super.key});

  @override
  State<MessengerListChatWidget> createState() =>
      _MessengerListChatWidgetState();
}

class _MessengerListChatWidgetState extends State<MessengerListChatWidget> {
  int _selectedIndex = 0;
  List<String> _options = ["Home", 'Channel'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10,),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex =
                        0; // Cập nhật chỉ mục của lựa chọn hiện tại khi người dùng nhấn
                  });

                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: 30,
                  decoration: BoxDecoration(
                    color:
                        _selectedIndex == 0 ? Colors.blue : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Home',
                    style: TextStyle(
                        color:
                            _selectedIndex == 0 ? Colors.white : Colors.grey),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = 1; // Cập nhật chỉ mục của lựa chọn hiện tại khi người dùng nhấn
                  });
                  print(_options[_selectedIndex]); // In ra giá trị được chọn
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: 30,
                  decoration: BoxDecoration(
                    color: _selectedIndex == 1 ? Colors.blue : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Channel',
                    style: TextStyle(color: _selectedIndex == 0 ? Colors.white : Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10,),
        MessengerChatWidget(),
        MessengerChatWidget(),
        MessengerChatWidget(),
        MessengerChatWidget(),
        MessengerChatWidget(),
        MessengerChatWidget(),
        MessengerChatWidget(),
        MessengerChatWidget(),
        MessengerChatWidget(),
        MessengerChatWidget(),
      ],
    );
  }
}
