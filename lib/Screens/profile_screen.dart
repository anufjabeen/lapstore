import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'cartscreen.dart';
import 'settings_screen.dart';
import 'authscreen.dart'; 
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: "Profile".text.xl2.white.semiBold.make(),
        centerTitle: true,
      ),
      body: VStack([
        //  Avatar and Name
        Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[800],
              child: const Icon(Icons.person, size: 50, color: Colors.white),
            ),
            10.heightBox,
            "Anuf Jabeen".text.lg.white.bold.make(),
            "anuf@example.com".text.sm.gray500.make(),
          ],
        ).p16(),

        30.heightBox,

        //  Cart
        _profileTile(
          icon: Icons.shopping_cart,
          title: "Cart",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CartScreen()),
            );
          },
        ),

        // Settings
        _profileTile(
          icon: Icons.settings,
          title: "Settings",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SettingsScreen()),
            );
          },
        ),

        // 🚪 Logout
        _profileTile(
          icon: Icons.logout,
          title: "Logout",
          onTap: () {
            
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => AuthScreen()),
              (route) => false,
            );
          },
        ),
      ]),
    );
  }

  Widget _profileTile({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: title.text.base.white.make(),
      trailing: const Icon(Icons.chevron_right, color: Colors.white),
      onTap: onTap,
      tileColor: const Color(0xFF1C1C1E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    ).p8();
  }
}