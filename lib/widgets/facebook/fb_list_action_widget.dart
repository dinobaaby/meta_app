import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_layout/multi_image_layout.dart';

class FB_ListAction extends StatefulWidget {
  const FB_ListAction({super.key});

  @override
  State<FB_ListAction> createState() => _FB_ListActionState();
}

class _FB_ListActionState extends State<FB_ListAction> {
  int visibleRowCount = 4; // Số lượng hàng được hiển thị ban đầu
  bool isExpanded = false; // Biến để kiểm soát việc mở rộng

  @override


  Widget build(BuildContext context) {

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 5),
      shrinkWrap: true,
      children: [
        for (int i = 0; i < visibleRowCount; i++)
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FB_Action_Item(),
              FB_Action_Item(),
            ],
          ),
        if (isExpanded)
          const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FB_Action_Item(),
                  FB_Action_Item(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FB_Action_Item(),
                  FB_Action_Item(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FB_Action_Item(),
                  FB_Action_Item(),
                ],
              ),
            ],
          ),
        Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFC2C2C2),
            borderRadius: BorderRadius.circular(10)
          ),
          child: TextButton(
            onPressed: () {
              setState(() {
                // Khi nút được nhấn, chuyển đổi trạng thái mở rộng
                isExpanded = !isExpanded;
              });
            },
            child: Text(isExpanded ? 'Ẩn bớt' : 'Xem thêm', style:
            const TextStyle(color: Colors.black),)
          ),
        ),
      ],
    );
  }
}

class FB_Action_Item extends StatelessWidget {
  const FB_Action_Item({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 80,
      margin:const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 0.5,
          ),
        ],
        color: Colors.white,
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:const EdgeInsets.only(left: 10),
            child: const Icon(Icons.groups, color: Colors.blueAccent,),
          ),
          Container(
            padding:const EdgeInsets.only(left: 5),
            child: const Text(
              "Group",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
