// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:novachat/components/app_colors.dart';
import 'package:novachat/modules/chat_pages/components/button_cpv.dart';
import 'package:novachat/modules/chat_pages/screen/profil.dart';

class MessengerChatPage extends StatefulWidget {
  const MessengerChatPage({
    Key? key,
    required this.name,

    bool isTyping = false,
    required this.profilimage,
  }) : super(key: key);
  final String name;
  final String profilimage;

  @override
  State<MessengerChatPage> createState() => _MessengerChatPageState();
}

class _MessengerChatPageState extends State<MessengerChatPage> {
  bool isTyping = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// 🔝 APP BAR
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              AppColors.blue,
              BlendMode.srcIn,
            ),
          ),
        ),

        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatProfilePage(
                      name: widget.name,
                      profilimage: widget.profilimage,
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(widget.profilimage),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Messenger',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),

        actions: [
          IconButton(
            onPressed: () {
              // call action
            },
            icon: SvgPicture.asset(
              'assets/icons/call.svg',
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
            ),
          ),
          const SizedBox(width: 16),
          IconButton(
            onPressed: () {
              // video call action
            },
            icon: SvgPicture.asset(
              'assets/icons/videocall.svg',
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),

      /// 💬 BODY
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                const SizedBox(height: 30),

                /// 👤 PROFILE INTRO
                Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(widget.profilimage),
                    ),
                    SizedBox(height: 12),
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "You're friends on Facebook",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    SizedBox(height: 30),
                  ],
                ),

                /// 🕒 TIME
                const Center(
                  child: Text(
                    '21:32',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),

                const SizedBox(height: 20),

                /// 👋 EMOJI MESSAGE (RIGHT)
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Color(0xffE7F3FF),
                      shape: BoxShape.circle,
                    ),
                    child: const Text('👋', style: TextStyle(fontSize: 28)),
                  ),
                ),

                const SizedBox(height: 20),

                /// 🕒 TIME
                const Center(
                  child: Text(
                    '16:44',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),

                const SizedBox(height: 16),

                /// 👤 LEFT MESSAGE
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const CircleAvatar(
                      radius: 14,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?img=47',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Text('Hello, Jacob!'),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                /// 👤 LEFT MESSAGE
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(width: 36),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Text('How are you doing?'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// ⌨️ INPUT BAR
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 6),
              ],
            ),
            child: Row(
              children: [
                const SizedBox(width: 12),

                BottomCpv(
                  onPressed: () {},
                  iconpath: 'assets/icons/camera.svg',
                  width: 24.w,
                  height: 24.h,
                  color: AppColors.blue,
                ),
                const SizedBox(width: 12),
                BottomCpv(
                  onPressed: () {},
                  iconpath: 'assets/icons/gallery.svg',
                  width: 24.w,
                  height: 24.h,
                  color: AppColors.blue,
                ),

                const SizedBox(width: 12),

                const SizedBox(width: 12),

                /// TEXT FIELD
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: _controller,
                      onChanged: (text) {
                        setState(() {
                          isTyping = text.trim().isNotEmpty;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Aa',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),
                isTyping
                    ? BottomCpv(
                        onPressed: () {
                          _controller.clear();
                          setState(() => isTyping = false);
                        },
                        iconpath: 'assets/icons/send2.svg',
                        width: 24.w,
                        height: 38.h,
                        color: AppColors.blue,
                      )
                    : BottomCpv(
                        onPressed: () {},
                        iconpath: 'assets/icons/voice.svg',
                        width: 24.w,
                        height: 38.h,
                        color: AppColors.blue,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
