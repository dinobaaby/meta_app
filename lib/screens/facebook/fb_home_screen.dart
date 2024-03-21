import 'package:flutter/material.dart';
import 'package:meta_app/utils/facebook/fb_colors.dart';
import '../../pages/facebook/fb_pages.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    WatchPage(),
    MarketPlacePages(),
    AnalyticsPage(),
    NotificationsPage(),
    MenusPage(),
  ];

  void _onNavigationItemSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: _NavigationBar(
        onItemSelected: _onNavigationItemSelected,
        currentIndex: _currentIndex,
      ),
    );
  }
}

class _NavigationBar extends StatelessWidget {
  const _NavigationBar({
    Key? key,
    required this.onItemSelected,
    required this.currentIndex,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavigationBarItem(
            index: 0,
            icon: Icons.home_filled,
            isSelected: currentIndex == 0,
            onTap: onItemSelected,
          ),
          _NavigationBarItem(
            index: 1,
            icon: Icons.smart_display,
            isSelected: currentIndex == 1,
            onTap: onItemSelected,
          ),
          _NavigationBarItem(
            index: 2,
            icon: Icons.storefront ,
            isSelected: currentIndex == 2,
            onTap: onItemSelected,
          ),
          _NavigationBarItem(
            index: 3,
            icon: Icons.analytics ,
            isSelected: currentIndex == 3,
            onTap: onItemSelected,
          ),
          _NavigationBarItem(
            index: 4,
            icon: Icons.notifications,
            isSelected: currentIndex == 4,
            onTap: onItemSelected,
          ),
          _NavigationBarItem(
            index: 5,
            icon: Icons.menu,
            isSelected: currentIndex == 5,
            onTap: onItemSelected,
          ),
        ],
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({
    super.key,
    required this.index,
    required this.icon,
    this.isSelected = false,
    required this.onTap,
  });

  final int index;
  final IconData icon;
  final bool isSelected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 55,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 25,
                color: isSelected ? button_fb_color : button_bottombar_not_selected,
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
