import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AsusScreen extends StatelessWidget {
  const AsusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(fontFamily: 'Inter');
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Asus", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/banners/asusu.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Incredible Comes From Within.",
                      style: textStyle.copyWith(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  8.heightBox,
                  Text(
                    "Asus offers innovation and power with sleek and powerful laptops.",
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
                  _dealCard("Asus Gaming Boost", "Discount on ROG Series Laptops."),
                  12.heightBox,
                  _dealCard("Zero Interest EMI", "On selected Asus models."),
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
                  Navigator.pushNamed(context, '/shop', arguments: {'brand': 'Asus'});
                },
                child: const Text("Browse All Asus Products",
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
