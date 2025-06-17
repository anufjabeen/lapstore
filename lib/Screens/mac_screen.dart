import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MacScreen extends StatelessWidget {
  const MacScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(fontFamily: 'Inter');

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Apple", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/banners/apple/MacBook Air M4.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            20.heightBox,

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Supercharged by the M3 chip.",
                    style: textStyle.copyWith(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  8.heightBox,
                  Text(
                    "Experience next-level performance and battery life. Designed for creativity, power, and Apple Intelligence.",
                    style: textStyle.copyWith(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.6,
                    ),
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
                  _dealCard("Apple Student Offer", "Save up to 15% on MacBook."),
                  12.heightBox,
                  _dealCard("Warranty Bonus", "3-Year Warranty on MacBook Pro."),
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
                  Navigator.pushNamed(context, '/shop', arguments: {'brand': 'Apple'});
                },
                child: const Text("Browse All Apple Products",
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
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(subtitle, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}
