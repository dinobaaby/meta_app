import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/facebook/fb_colors.dart';

class MarketPlacePages extends StatelessWidget {
  const MarketPlacePages({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23,color: title_fb_color),),
        actions: [
          IconButton(
            icon: const Icon(Icons.person,),
            onPressed: () {},
          ),
          IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.search))
        ],
      ),
    );
  }
}
