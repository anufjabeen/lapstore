import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HpScreen extends StatelessWidget {
  const HpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(fontFamily: 'Inter');
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("HP", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/banners/hpuu.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Power to perform, freedom to move.",
                      style: textStyle.copyWith(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  8.heightBox,
                  Text(
                    "HP laptops combine performance with style, ideal for work and play.",
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
                  _dealCard("HP Back to School Offer", "Save up to 20% on select models."),
                  12.heightBox,
                  _dealCard("Free Mouse & Bag", "On every laptop purchase."),
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
                  Navigator.pushNamed(context, '/shop', arguments: {'brand': 'HP'});
                },
                child: const Text("Browse All HP Products",
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
