import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MsStoryVideoHeaderWidget extends StatelessWidget {
  const MsStoryVideoHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 50,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/testImage.jpg"),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nguyễn Viết Hoàng", style: TextStyle(color: Colors.white),),
                    Text("5 giờ  Viet Hoang >", style: TextStyle(color: Colors.grey, fontSize: 12),)
                  ],
                )
              ],
            ),
             Row(
              children: [
                InkWell(
                  child: Container(width: 40, height: 30,child: Icon(Icons.more_horiz, color: Colors.white,size: 25,)),
                ),
                InkWell(
                  child: Container(width: 40, height: 30,child: Icon(Icons.volume_up, color: Colors.white,size: 25,)),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(width: 40, height: 30,child: Icon(Icons.close, color: Colors.white,size: 25,)),
                )

              ],
            )
          ],
      ),
    );
  }
}
