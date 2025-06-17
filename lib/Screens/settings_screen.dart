import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDark = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: isDark ? Colors.black : Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
        title: Text(
          "Settings",
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListTile(
        leading: Icon(Icons.brightness_6, color: isDark ? Colors.white : Colors.black),
        title: Text(
          isDark ? "Dark Theme" : "Light Theme",
          style: TextStyle(color: isDark ? Colors.white : Colors.black),
        ),
        trailing: Switch(
          value: isDark,
          onChanged: (val) {
            setState(() => isDark = val);
            
          },
        ),
      ),
    );
  }
}
