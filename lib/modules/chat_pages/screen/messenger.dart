// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MessengerChatPage extends StatelessWidget {
  

  const MessengerChatPage({
    Key? key,
    required this.name,
  }) : super(key: key);
final String name;
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,

      /// 🔝 APP BAR
      appBar: AppBar(
  elevation: 0,
  backgroundColor: Colors.white,

  leading: IconButton(
    icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
    onPressed: () {
      Navigator.pop(context);
    },
  ),

  title: Row(
    children: [
      const CircleAvatar(
        radius: 18,
        backgroundImage: NetworkImage(
          'https://i.pravatar.cc/150?img=47',
        ),
      ),
      const SizedBox(width: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Messenger',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ],
  ),

  actions: const [
    Icon(Icons.call, color: Colors.blue),
    SizedBox(width: 16),
    Icon(Icons.videocam, color: Colors.blue),
    SizedBox(width: 12),
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
                  children:  [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?img=47',
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "You're friends on Facebook",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
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
                    child: const Text(
                      '👋',
                      style: TextStyle(fontSize: 28),
                    ),
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
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(Icons.grid_view, color: Colors.blue),
                const SizedBox(width: 12),
                Icon(Icons.camera_alt, color: Colors.blue),
                const SizedBox(width: 12),
                Icon(Icons.image, color: Colors.blue),
                const SizedBox(width: 12),
                Icon(Icons.mic, color: Colors.blue),
                const SizedBox(width: 12),

                /// TEXT FIELD
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Aa',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),
                Icon(Icons.thumb_up, color: Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
