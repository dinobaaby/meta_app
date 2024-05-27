import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta_app/widgets/facebook/fb_product_widget.dart';
import 'package:multi_image_layout/multi_image_layout.dart';

import '../../utils/facebook/fb_colors.dart';

class MarketPlacePage extends StatelessWidget {
  const MarketPlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Marketplace',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
            color: title_fb_color,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
            ),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.search),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Bán",
                    style: TextStyle(fontSize: 12, color: button_fb_color),
                  ),
                ),
                const SizedBox(
                  height: 30,
                  child: VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Dành cho bạn",
                    style: TextStyle(fontSize: 12, color: button_fb_color),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Hạng mục",
                    style: TextStyle(fontSize: 12, color: button_fb_color),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  flex: 1,
                  child: Text(
                    "Lựa chọn hôm nay",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(foregroundColor: button_fb_color),
                    child: const Row(children: [
                      Icon(Icons.location_on_sharp),
                      Text(
                          "Ha Dong, Ha Noi, VietNam",
                          style: TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              children: List.generate(
                20,
                (index) => const FBProductWidget(
                  image:
                      "https://images.unsplash.com/photo-1416339306562-f3d12fefd36f",
                  title: "VNĐ 500.000 Cái gì đó",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
