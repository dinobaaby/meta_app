import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../utils/facebook/fb_colors.dart';
import '../../widgets/facebook/fb_build_step_row_widget.dart';
import '../../widgets/facebook/fb_info_card_widget.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Bảng điều khiển chuyên nghiệp',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: title_fb_color,
                  ),
                  maxLines: 2,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                )
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _buildNavigationButtons(),
              ),
            ),
          ],
        ),
        toolbarHeight: 100,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Các bước tiếp theo",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              BuildStepRow(
                imagePath: "assets/logos/progress_logo.png",
                title: "Tiến độ cấp 2",
                subtitle: "Còn 56%",
                progressValue: 0.44,
              ),
              BuildStepRow(
                imagePath: "assets/logos/group_logo.png",
                title: "Tham gia nhóm để phát triển đối tượng",
                subtitle:
                    "Bạn có thể tăng lượt tương tác bằng cách kết nối với cộng đồng mới",
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.grey,
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hiệu quả",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Icon(Icons.info),
                ],
              ),
              const SizedBox(height: 10),
              const Text("Người theo dõi: 330"),
              const SizedBox(height: 5),
              const Text(
                "90 ngày qua",
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 10),
              StaggeredGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: InfoCardWidget(
                      title: "Số người tiếp cận",
                      value: "1,3K",
                      increase: 235,
                      time: "từ 90 ngày trước",
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: InfoCardWidget(
                      title: "Nội dung đã đăng",
                      value: "5",
                      increase: 0,
                      time: "từ 90 ngày trước",
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: InfoCardWidget(
                      title: "Lượt tương tác",
                      value: "214",
                      increase: 1000,
                      time: "từ 90 ngày trước",
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: InfoCardWidget(
                      title: "Số người theo dõi",
                      value: "-1",
                      increase: 0,
                      time: "từ 90 ngày trước",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: button_fb_color,
                      backgroundColor: button_background_color
                    ),
                      onPressed: () {}, child: const Text("Xem thông tin chi tiết")),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildNavigationButtons() {
    final List<String> buttonLabels = [
      'Trang chủ',
      'Thông tin chi tiết',
      'Sáng tạo',
      'Tương tác',
    ];

    return buttonLabels.map((label) {
      return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: button_background_color,
          ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 12, color: button_fb_color),
          ),
        ),
      );
    }).toList();
  }
}
