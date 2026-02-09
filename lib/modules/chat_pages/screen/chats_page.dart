import 'package:flutter/material.dart';
import 'package:novachat/modules/chat_pages/screen/messenger.dart';

import 'package:novachat/modules/chat_pages/screen/settings_screen.dart';

class MessengerChatsPage extends StatelessWidget {
  const MessengerChatsPage({
    super.key,
    required this.name,
    required this.profilimage,
  });
  final String name;
  final String profilimage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            /// 🔝 HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsScreen(),
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?img=12',
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Chats',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  _circleIcon(context, Icons.camera_alt),
                  const SizedBox(width: 10),
                  _circleIcon(context, Icons.edit),
                ],
              ),
            ),

            /// 🔍 SEARCH
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 8),
                    Text('Search', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// 🟢 STORIES
            SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _storyItem(isAdd: true, name: 'Your story'),
                  _storyItem(name: 'Joshua'),
                  _storyItem(name: 'Martin'),
                  _storyItem(name: 'Karen'),
                  _storyItem(name: 'Martha'),
                ],
              ),
            ),

            const SizedBox(height: 8),

            /// 💬 CHAT LIST
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _chatTile(
                    context: context,
                    name: 'Martin Randolph',
                    message: "You: What's man! · 9:40 AM",
                    online: true,
                    profilimage: "https://i.pravatar.cc/150?img=32",
                  ),
                  _chatTile(
                    context: context,
                    name: 'Andrew Parker',
                    message: 'You: Ok, thanks! · 9:25 AM',
                    online: true,
                    profilimage: "https://i.pravatar.cc/150?img=32",
                  ),
                  _chatTile(
                    name: 'Karen Castillo',
                    message: 'You: Ok, see you... · Fri',
                    context: context,
                    profilimage: "https://i.pravatar.cc/150?img=32",
                  ),
                  _chatTile(
                    name: 'Maisy Humphrey',
                    message: 'Have a good day, Maisy! · Fri',
                    context: context,
                    profilimage: "https://i.pravatar.cc/150?img=32",
                  ),
                  _chatTile(
                    name: 'Joshua Lawrence',
                    message: 'The business plan loo... · Thu',
                    context: context,
                    profilimage: "https://i.pravatar.cc/150?img=32",
                  ),

                  const SizedBox(height: 12),

                  /// 🔥 AD ITEM
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pixsellz',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Make design process easier...',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Colors
                                      .white // Dark Mode -> ак түстө
                                : Colors.black, // Light Mode -> кара түстө
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            'View More',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔘 HEADER ICON
  static Widget _circleIcon(BuildContext context, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors
                  .white // Dark Mode -> ак түстө
            : Colors.black, // Light Mode -> кара түстө
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 20,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors
                  .black // Dark Mode -> иконка кара
            : Colors.white, // Light Mode -> иконка ак
      ),
    );
  }

  /// 🟢 STORY ITEM
  static Widget _storyItem({bool isAdd = false, String name = ''}) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: isAdd
                    ? Colors.grey.shade300
                    : Colors.transparent,
                backgroundImage: isAdd
                    ? null
                    : NetworkImage(
                        'https://i.pravatar.cc/150?img=${name.length * 3}',
                      ),
                child: isAdd ? const Icon(Icons.add, size: 28) : null,
              ),
              if (!isAdd)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(name, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  /// 💬 CHAT TILE
  static Widget _chatTile({
    required BuildContext context,
    required String name,
    required String message,
    bool online = false,
    required String profilimage,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                MessengerChatPage(name: name, profilimage: profilimage),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundImage: NetworkImage(profilimage),
                ),
                if (online)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
            const Icon(Icons.check_circle, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
