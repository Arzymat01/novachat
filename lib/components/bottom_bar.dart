import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:novachat/modules/chat_pages/screen/chats_page.dart';
import 'package:novachat/modules/contact_pages/screen/contact_pages_screen.dart';
import 'package:novachat/modules/main_page/screen/main_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 1;

  final List<String> _icons = [
    'assets/icons/icon_sms.svg',
    'assets/icons/icon_status.svg',
    'assets/icons/icon_man.svg',
  ];

  /// 🔹 БАРАКТАР
  final List<Widget> _pages = const [
    MessengerChatsPage(name: "", profilimage: ""),
    MainScreen(),
    ContactPagesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Container(
            height: 70.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                /// ICONS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    _icons.length,
                    (index) => _buildItem(index),
                  ),
                ),

                /// ⬇️ ТӨМӨНКҮ ИНДИКАТОР
                AnimatedAlign(
                  duration: const Duration(milliseconds: 300),
                  alignment: _indicatorAlignment(),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 8.h),
                    width: 100.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Alignment _indicatorAlignment() {
    if (_selectedIndex == 0) return Alignment.bottomLeft;
    if (_selectedIndex == 1) return Alignment.bottomCenter;
    return Alignment.bottomRight;
  }

  Widget _buildItem(int index) {
    final isActive = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() => _selectedIndex = index);
      },
      child: SizedBox(
        width: 60.w,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Center(
              child: SvgPicture.asset(
                _icons[index],
                width: 26.w,
                height: 26.w,
                colorFilter: ColorFilter.mode(
                  isActive ? Colors.black : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
            ),

            /// 🔔 BADGE (Users)
            if (index == 2)
              Positioned(
                right: 6,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
