import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MsStoryVideoReactionWidget extends StatefulWidget {
  const MsStoryVideoReactionWidget({super.key});

  @override
  State<MsStoryVideoReactionWidget> createState() => _MsStoryVideoReactionWidgetState();
}

class _MsStoryVideoReactionWidgetState extends State<MsStoryVideoReactionWidget> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _sentController = TextEditingController();
  String _content ="";
  bool _isFocused = false;

  @override
  void initState() {

    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;

      });
    });
  }
  @override
  void dispose() {
    super.dispose();
    _sentController.dispose();
    _focusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 80,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 40,
                child: TextField(
                  focusNode: _focusNode,
                  controller: _sentController,
                  decoration:const InputDecoration(
                    border:  OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30)
                      )
                    ),
                    hintText: "Gửi tin nhắn",
                    contentPadding:  EdgeInsets.only(bottom: 10, left: 15),
                    hintStyle:  TextStyle(color: Colors.grey),
                    
                  ),
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value){
                    setState(() {
                      _content = value;
                    });
                  },
                ),
              ),
              const SizedBox(width: 10,),
              IconButton(onPressed: (){}, icon: Icon(Icons.favorite, size: 40,color: Colors.red,)),
              InkWell(
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  child: const Text("😆", style: TextStyle(fontSize: 30),),
                ),
              ),
              const SizedBox(width: 10,),
              InkWell(
                child: Container(

                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  child: const Text("😯", style: TextStyle(fontSize: 30),),
                ),
              )
            ],
        ),
      ),
    );
  }
}
