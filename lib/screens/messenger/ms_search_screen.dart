import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:meta_app/utils/messenger/ms_colors.dart';

class MessengerSearchScreen extends StatefulWidget {
  const MessengerSearchScreen({super.key});

  @override
  State<MessengerSearchScreen> createState() => _MessengerSearchScreenState();
}

class _MessengerSearchScreenState extends State<MessengerSearchScreen> {
  final TextEditingController _searchController = TextEditingController();


  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
            child: Scaffold(
              backgroundColor: ms_background_color,
              body: Column(
                
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 9,
                          child: Container(
                            height: 40,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(48, 48, 48, 1.0),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: TextField(
                              controller: _searchController,
                              style: TextStyle(
                                color: Colors.white
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.search, color: Color.fromRGBO(
                                    143, 137, 137, 1.0),),
                                hintText: "Search",
                                hintStyle: TextStyle(color:  Color.fromRGBO(
                                    143, 137, 137, 1.0)),
                                contentPadding: EdgeInsets.only(bottom: 10),

                              ),


                            ),
                          ),

                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              child: Text("Cancel", style: TextStyle(color: action_appbar_ms_color, fontSize: 15, fontWeight: FontWeight.w600),),
                          ),),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
