import 'package:flutter/material.dart';
import 'package:multi_image_layout/image_model.dart';
import 'package:multi_image_layout/multi_image_viewer.dart';
import 'package:readmore/readmore.dart';

import '../../utils/facebook/fb_colors.dart';


class FBNewsWidget extends StatefulWidget {
  const FBNewsWidget({super.key});

  @override
  State<FBNewsWidget> createState() => _FBNewsWidgetState();
}

class _FBNewsWidgetState extends State<FBNewsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 3),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
            const Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('AH'),
                ),
                SizedBox( width: 5,),
                 Expanded(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name",style: TextStyle(fontSize: 12, color: button_bottombar_not_selected),),
                      Row(
                        children: [
                          Text("Time - ", style: TextStyle(fontSize: 8, color: button_bottombar_not_selected),),
                          Icon(Icons.public,size: 12,)
                        ],
                      )
                    ],
                   ),
                 )
              ],
            ),
            const SizedBox(height: 10,),
            const ReadMoreText(
              'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                trimLines: 2,
                style: TextStyle(fontSize: 12, color: Colors.black),
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                moreStyle: TextStyle(fontSize: 11),
            ),
          const SizedBox(height: 10,),
          MultiImageViewer(
            images: [
              ImageModel(
                imageUrl:
                "https://3.img-dpreview.com/files/p/TS250x250~sample_galleries/3800753625/8719688791.jpg",
                caption: "A caption here",
              ),
              ImageModel(
                  imageUrl:
                  "https://3.img-dpreview.com/files/p/TS250x250~sample_galleries/3800753625/4086993630.jpg"),
              ImageModel(
                  imageUrl:
                  "https://2.img-dpreview.com/files/p/TS250x250~sample_galleries/3800753625/5713335642.jpg"),
              ImageModel(
                  imageUrl:
                  "https://1.img-dpreview.com/files/p/TS250x250~sample_galleries/3800753625/6294874831.jpg"),
              ImageModel(
                  imageUrl:
                  "https://3.img-dpreview.com/files/p/TS250x250~sample_galleries/3800753625/8719688791.jpg"),
              ImageModel(
                  imageUrl:
                  "https://3.img-dpreview.com/files/p/TS250x250~sample_galleries/3800753625/4086993630.jpg"),
              ImageModel(
                  imageUrl:
                  "https://2.img-dpreview.com/files/p/TS250x250~sample_galleries/3800753625/5713335642.jpg"),
            ],
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
              color: Colors.white,
            ),
          ),

        ],
      ),
    );
  }
}
