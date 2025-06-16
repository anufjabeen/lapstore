import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cartscreen.dart';

class HPScreen extends StatelessWidget {
  // No featured section—just list HP models as in ShopScreen
  final List<Map<String, String>> allHP = [
    {
      'title': 'HP Spectre x360',
      'subtitle': 'Versatile 2-in-1 for creators.',
      'price': 'From \$1199',
      'image': 'assets/images/hp_spectre.jpg'
    },
    {
      'title': 'HP Omen 16',
      'subtitle': 'Built for high performance gaming.',
      'price': 'From \$1399',
      'image': 'assets/images/hp_omen.jpg'
    },
    {
      'title': 'HP Pavilion',
      'subtitle': 'Affordable, reliable.',
      'price': 'From \$799',
      'image': 'assets/images/hp_pavilion.jpg'
    },
    {
      'title': 'HP Envy',
      'subtitle': 'Stylish and powerful.',
      'price': 'From \$1099',
      'image': 'assets/images/hp_envy.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.inter();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('HP Laptops', style: textStyle.copyWith(color: Colors.white)),
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
              Text('HP Models', style: textStyle.copyWith(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              Column(
                children: allHP.map((hp) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 16),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      children: [
                        Image.asset(hp['image']!, width: 80, height: 80, fit: BoxFit.cover),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(hp['title']!, style: textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                              if (hp['subtitle'] != null)
                                Text(hp['subtitle']!, style: textStyle.copyWith(fontSize: 13, color: Colors.grey[800])),
                              Text(hp['price']!, style: textStyle.copyWith(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
                              SizedBox(height: 6),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Cart.add(hp);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text("${hp['title']} added to cart!")));
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
