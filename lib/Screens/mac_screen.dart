import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cartscreen.dart';

class MacScreen extends StatelessWidget {
  // Featured product matches Home/Shop
  final List<Map<String, String>> featuredMacs = [
    {
      'title': 'MacBook Air',
      'subtitle': 'Supercharged by the M3 chip. Built for Apple Intelligence.°',
      'price': 'From \$999',
      'image': 'assets/banners/macbookair.jpeg'
    },
  ];

  // All Apple laptops as per ShopScreen
  final List<Map<String, String>> allMacs = [
    {
      'title': 'MacBook Air M4',
      'subtitle': 'Supercharged by the M4 chip. Built for Apple Intelligence',
      'price': 'From \$1099',
      'image': 'assets/banners/apple/MacBook Air M4.jpg'
    },
    {
      'title': 'MacBook Pro M2',
      'subtitle': 'Ultimate pro performance.',
      'price': 'From \$1999',
      'image': 'assets/banners/apple/MacBook Air M4.jpg'
    },
    {
      'title': 'MacBook Pro 14',
      'subtitle': 'Proven Apple power.',
      'price': 'From \$999',
      'image': 'assets/banners/apple/MacBook Pro 14 (M3 Pro).jpg'
    },
    {
      'title': 'MacBook Pro M1',
      'subtitle': 'For creative professionals.',
      'price': 'From \$1799',
      'image': 'assets/banners/apple/MacBook Air M1 (2020).png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.inter();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Apple Laptops', style: textStyle.copyWith(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => CartScreen()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Featured Apple Laptop', style: textStyle.copyWith(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: featuredMacs.length,
                  itemBuilder: (context, index) {
                    final mac = featuredMacs[index];
                    return Container(
                      width: 260,
                      margin: EdgeInsets.only(right: 12),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(mac['image']!, height: 120, fit: BoxFit.contain),
                          SizedBox(height: 8),
                          Text(mac['title']!, style: textStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
                          if (mac['subtitle'] != null)
                            Text(mac['subtitle']!, style: textStyle.copyWith(fontSize: 12, color: Colors.grey[700])),
                          Text(mac['price']!, style: textStyle.copyWith(color: Colors.grey[700])),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  Cart.add(mac);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("${mac['title']} added to cart!")));
                                },
                                style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    side: BorderSide(color: Colors.black)),
                                child: Text('Buy', style: textStyle),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24),
              Text('All Apple Models', style: textStyle.copyWith(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              Column(
                children: allMacs.map((mac) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 16),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      children: [
                        Image.asset(mac['image']!, width: 80, height: 80, fit: BoxFit.cover),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(mac['title']!, style: textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                              if (mac['subtitle'] != null)
                                Text(mac['subtitle']!, style: textStyle.copyWith(fontSize: 13, color: Colors.grey[800])),
                              Text(mac['price']!, style: textStyle.copyWith(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
                              SizedBox(height: 6),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Cart.add(mac);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text("${mac['title']} added to cart!")));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
                                    child: Text('Buy', style: textStyle.copyWith(color: Colors.white)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
