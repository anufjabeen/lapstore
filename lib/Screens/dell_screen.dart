import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DellScreen extends StatelessWidget {
  const DellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(fontFamily: 'Inter');
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Dell", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/banners/dellu.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Built for Brilliance.",
                      style: textStyle.copyWith(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  8.heightBox,
                  Text(
                    "Dell laptops combine robust performance and sleek design for every need.",
                    style: textStyle.copyWith(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            28.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Exclusive Deals",
                  style: textStyle.copyWith(
                      color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            12.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _dealCard("Dell Productivity Pack", "Save with bundled accessories."),
                  12.heightBox,
                  _dealCard("Extended Warranty", "Get up to 4 years coverage."),
                ],
              ),
            ),
            36.heightBox,
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/shop', arguments: {'brand': 'Dell'});
                },
                child: const Text("Browse All Dell Products",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            40.heightBox,
          ],
        ),
      ),
    );
  }

  Widget _dealCard(String title, String subtitle) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}
