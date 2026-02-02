import 'package:flutter/material.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔹 HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Chats',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      _circleIcon(Icons.camera_alt),
                      const SizedBox(width: 10),
                      _circleIcon(Icons.edit),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 16),

              /// 🔍 SEARCH
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// 📸 STORIES
              SizedBox(
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _storyItem(add: true, name: 'Your story'),
                    _storyItem(name: 'Joshua'),
                    _storyItem(name: 'Martin'),
                    _storyItem(name: 'Karen'),
                    _storyItem(name: 'Maisy'),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              /// 💬 CHAT LIST
              Expanded(
                child: ListView(
                  children: const [
                    ChatTile(
                      name: 'Martin Randolph',
                      message: "You: What's man! · 9:40 AM",
                      online: true,
                    ),
                    ChatTile(
                      name: 'Andrew Parker',
                      message: 'You: Ok, thanks! · 9:25 AM',
                    ),
                    ChatTile(
                      name: 'Karen Castillo',
                      message: 'You: Ok, See you in To... · Fri',
                    ),
                    ChatTile(
                      name: 'Maisy Humphrey',
                      message: 'Have a good day, Maisy! · Fri',
                    ),
                    ChatTile(
                      name: 'Joshua Lawrence',
                      message: 'The business plan loo... · Thu',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 CIRCLE ICON
  Widget _circleIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 20),
    );
  }

  /// 🔹 STORY ITEM
  Widget _storyItem({String? name, bool add = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey.shade300,
            child: add
                ? const Icon(Icons.add, size: 30)
                : null,
          ),
          const SizedBox(height: 6),
          Text(
            name ?? '',
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

/// 💬 CHAT TILE
class ChatTile extends StatelessWidget {
  final String name;
  final String message;
  final bool online;

  const ChatTile({
    super.key,
    required this.name,
    required this.message,
    this.online = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Stack(
        children: [
          const CircleAvatar(
            radius: 26,
            backgroundColor: Colors.grey,
          ),
          if (online)
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
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        message,
        style: TextStyle(color: Colors.grey.shade600),
      ),
      trailing: const Icon(Icons.check_circle_outline, size: 18),
    );
  }
}
