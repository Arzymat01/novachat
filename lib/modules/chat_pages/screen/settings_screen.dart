import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:novachat/components/app_colors.dart';
import 'package:novachat/components/call_button.dart';
import 'package:novachat/components/theme_controller.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  final ThemeController controller = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
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
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                "Done",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 20),

          /// Avatar
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue, width: 3),
                  ),
                ),
                const CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
                ),
                Positioned(
                  right: 5,
                  bottom: 5,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.camera_alt,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          /// Name
          const Center(
            child: Text(
              "Jacob West",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 30),

          /// Dark Mode
          ListTile(
            leading: CallButton(
              svgPath: "assets/icons/dark.svg",
              color: AppColors.dark,
              onTap: () {},
              radius: 20,
            ),
            title: const Text("Тёмный режим"),
            trailing: Obx(
              () => Switch(
                value: controller.isDark.value,
                onChanged: controller.changeTheme,
              ),
            ),
          ),
          const Divider(),

          /// Active Status
          ListTile(
            leading: CallButton(
              svgPath: "assets/icons/active.svg",
              color: AppColors.green,
              onTap: () {},
              radius: 20,
            ),
            title: Text("Активный статус"),
            trailing: Text("On", style: TextStyle(color: Colors.grey)),
          ),

          const Divider(),

          /// Username
          ListTile(
            leading: CallButton(
              svgPath: "assets/icons/email.svg",
              color: AppColors.email,
              onTap: () {},
              radius: 20,
            ),
            title: Text("Имя пользователя"),
            trailing: Text(
              "m.me/Jacob_d",
              style: TextStyle(color: Colors.grey),
            ),
          ),

          const Divider(),

          /// Phone
          ListTile(
            leading: CallButton(
              svgPath: "assets/icons/phone.svg",
              color: AppColors.phone,
              onTap: () {},
              radius: 20,
            ),
            title: Text("Телефон"),
            trailing: Text(
              "+1 202 555 0147",
              style: TextStyle(color: Colors.grey),
            ),
          ),

          const SizedBox(height: 20),

          /// Preferences
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "Настройки",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),

          ListTile(
            leading: CallButton(
              svgPath: "assets/icons/notif.svg",
              color: AppColors.phone,
              onTap: () {},
              radius: 20,
            ),
            title: const Text("Уведомления и звуки"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),

          ListTile(
            leading: CallButton(
              svgPath: "assets/icons/people.svg",
              color: AppColors.phone,
              onTap: () {},
              radius: 20,
            ),
            title: const Text("Люди"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),

          ListTile(
            leading: CallButton(
              svgPath: "assets/icons/icon_sms.svg",
              color: AppColors.phone,
              onTap: () {},
              radius: 20,
            ),
            title: const Text("Настройки сообщений"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
