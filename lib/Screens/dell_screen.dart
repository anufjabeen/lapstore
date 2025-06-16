import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cartscreen.dart';

class DellScreen extends StatelessWidget {
  // Featured matches Home/Shop
  final List<Map<String, String>> featuredDells = [
    {
      'title': 'Dell XPS',
      'subtitle': 'Sleek performance for professionals.',
      'price': 'From \$1099',
      'image': 'assets/banners/dellxps.png'
    },
  ];

  final List<Map<String, String>> allDells = [
    {
      'title': 'Dell XPS 13',
      'subtitle': 'Compact power for all-day work.',
      'price': 'From \$999',
      'image': 'assets/images/xps.jpg'
    },
    {
      'title': 'Dell Alienware',
      'subtitle': 'Legendary gaming powerhouse.',
      'price': 'From \$1799',
      'image': 'assets/images/alienware.jpg'
    },
    {
      'title': 'Dell Inspiron 15',
      'subtitle': 'Everyday performance.',
      'price': 'From \$799',
      'image': 'assets/images/inspiron.jpg'
    },
    {
      'title': 'Dell Vostro',
      'subtitle': 'Business essential.',
      'price': 'From \$899',
      'image': 'assets/images/vostro.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.inter();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Dell Laptops', style: textStyle.copyWith(color: Colors.white)),
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
              Text('Featured Dell Laptop', style: textStyle.copyWith(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: featuredDells.length,
                  itemBuilder: (context, index) {
                    final dell = featuredDells[index];
                    return Container(
                      width: 260,
                      margin: EdgeInsets.only(right: 12),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(dell['image']!, height: 120, fit: BoxFit.contain),
                          SizedBox(height: 8),
                          Text(dell['title']!, style: textStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
                          if (dell['subtitle'] != null)
                            Text(dell['subtitle']!, style: textStyle.copyWith(fontSize: 12, color: Colors.grey[700])),
                          Text(dell['price']!, style: textStyle.copyWith(color: Colors.grey[700])),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  Cart.add(dell);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("${dell['title']} added to cart!")));
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
              Text('All Dell Models', style: textStyle.copyWith(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              Column(
                children: allDells.map((dell) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 16),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      children: [
                        Image.asset(dell['image']!, width: 80, height: 80, fit: BoxFit.cover),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(dell['title']!, style: textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                              if (dell['subtitle'] != null)
                                Text(dell['subtitle']!, style: textStyle.copyWith(fontSize: 13, color: Colors.grey[800])),
                              Text(dell['price']!, style: textStyle.copyWith(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
                              SizedBox(height: 6),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Cart.add(dell);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text("${dell['title']} added to cart!")));
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
