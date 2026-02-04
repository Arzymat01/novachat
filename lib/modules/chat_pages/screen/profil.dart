import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:novachat/components/app_colors.dart';
import 'package:novachat/modules/chat_pages/components/button_cpv.dart';

class ChatProfilePage extends StatelessWidget {
  const ChatProfilePage({
    super.key,
    required this.name,
    required this.profilimage,
  });
  final String name;
  final String profilimage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            "assets/icons/back.svg",
            width: 24,
            height: 24,

            color: AppColors.blue,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),

            /// Avatar + Name
            CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage(profilimage),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text("Messenger", style: TextStyle(color: Colors.grey)),

            const SizedBox(height: 20),

            /// Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomCpv(
                  onPressed: () {},
                  iconpath: 'assets/icons/call.svg',
                  width: 24.w,
                  height: 24.h,
                  color: AppColors.blue,
                ),
                BottomCpv(
                  onPressed: () {},
                  iconpath: 'assets/icons/videocall.svg',
                  width: 24.w,
                  height: 24.h,
                  color: AppColors.blue,
                ),
              ],
            ),

            const SizedBox(height: 30),

            /// Settings list
            _Section(
              children: [
                _ListTile(
                  title: "Уведомление",
                  trailing: BottomCpv(
                    color: AppColors.red,
                    onPressed: () {},
                    iconpath: 'assets/icons/zvuk.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                _ListTile(
                  title: "Без звук",
                  trailing: BottomCpv(
                    color: AppColors.red,
                    onPressed: () {},
                    iconpath: 'assets/icons/zvuk.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                _ListTile(title: "Заблокировать", showArrow: true),
              ],
            ),

            const SizedBox(height: 20),

            /// More actions
            _Section(
              title: "Другие действия",
              children: [
                _ListTile(title: "Поиск", trailingIcon: Icons.search),
                _ListTile(title: "Создать группу", trailingIcon: Icons.group),
              ],
            ),

            const SizedBox(height: 20),

            /// Privacy
          ],
        ),
      ),
    );
  }
}

/// ---------------- COMPONENTS ----------------

class _Section extends StatelessWidget {
  final String? title;
  final List<Widget> children;

  const _Section({this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              title!,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ...children,
      ],
    );
  }
}

class _ListTile extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final IconData? trailingIcon;
  final String? trailingText;
  final bool showArrow;
  final bool isDanger;

  const _ListTile({
    required this.title,
    this.trailing,
    this.trailingIcon,
    this.trailingText,
    this.showArrow = false,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: isDanger ? Colors.red : Colors.black),
      ),
      trailing:
          trailing ??
          (trailingIcon != null
              ? Icon(trailingIcon, color: isDanger ? Colors.red : Colors.black)
              : trailingText != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(trailingText!),
                    if (showArrow) const Icon(Icons.chevron_right),
                  ],
                )
              : (showArrow ? const Icon(Icons.chevron_right) : null)),
      onTap: () {},
    );
  }
}
