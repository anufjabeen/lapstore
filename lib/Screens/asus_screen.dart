import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cartscreen.dart';

class Asusscreen extends StatelessWidget {
  // Featured matches Home/Shop
  final List<Map<String, String>> featuredAsus = [
    {
      'title': 'ASUS ROG',
      'subtitle': 'Performance beast for gamers.',
      'price': 'From \$1299',
      'image': 'assets/banners/asusrog.jpg'
    },
  ];

  final List<Map<String, String>> allAsus = [
    {
      'title': 'ASUS ROG Zephyrus',
      'subtitle': 'For serious gamers.',
      'price': 'From \$1399',
      'image': 'assets/images/rog.jpg'
    },
    {
      'title': 'ASUS TUF Gaming',
      'subtitle': 'Durable, budget gaming.',
      'price': 'From \$1199',
      'image': 'assets/images/tuf.jpg'
    },
    {
      'title': 'ASUS Vivobook',
      'subtitle': 'Sleek, everyday productivity.',
      'price': 'From \$899',
      'image': 'assets/images/vivobook.jpg'
    },
    {
      'title': 'ASUS Zenbook',
      'subtitle': 'Premium build and style.',
      'price': 'From \$1099',
      'image': 'assets/images/zenbook.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.inter();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('ASUS Laptops', style: textStyle.copyWith(color: Colors.white)),
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
              Text('Featured ASUS Laptop', style: textStyle.copyWith(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: featuredAsus.length,
                  itemBuilder: (context, index) {
                    final asus = featuredAsus[index];
                    return Container(
                      width: 260,
                      margin: EdgeInsets.only(right: 12),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(asus['image']!, height: 120, fit: BoxFit.contain),
                          SizedBox(height: 8),
                          Text(asus['title']!, style: textStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
                          if (asus['subtitle'] != null)
                            Text(asus['subtitle']!, style: textStyle.copyWith(fontSize: 12, color: Colors.grey[700])),
                          Text(asus['price']!, style: textStyle.copyWith(color: Colors.grey[700])),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  Cart.add(asus);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("${asus['title']} added to cart!")));
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
              Text('All ASUS Models', style: textStyle.copyWith(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              Column(
                children: allAsus.map((asus) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 16),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      children: [
                        Image.asset(asus['image']!, width: 80, height: 80, fit: BoxFit.cover),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(asus['title']!, style: textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                              if (asus['subtitle'] != null)
                                Text(asus['subtitle']!, style: textStyle.copyWith(fontSize: 13, color: Colors.grey[800])),
                              Text(asus['price']!, style: textStyle.copyWith(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
                              SizedBox(height: 6),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Cart.add(asus);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text("${asus['title']} added to cart!")));
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
