import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import "profile_screen.dart";

import 'mac_screen.dart';
import 'dell_screen.dart';
import 'hp_screen.dart';
import 'asus_screen.dart';
import 'shopscreen.dart';
import 'cartscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, String>> categories = [
    {'title': 'Apple', 'image': 'assets/banners/macbook.jpg'},
    {'title': 'Dell', 'image': 'assets/banners/dell.jpeg'},
    {'title': 'HP', 'image': 'assets/banners/hp.jpg'},
    {'title': 'ASUS', 'image': 'assets/banners/asuss.jpg'},
  ];

  final List<Map<String, String>> featuredLaptops = [
    {
      'title': 'MacBook Air',
      'subtitle': 'Supercharged by the M3 chip. Built for Apple Intelligence.°',
      'price': 'From \$999',
      'image': 'assets/banners/macbookair.jpeg'
    },
    {
      'title': 'Dell XPS',
      'subtitle': 'Sleek performance for professionals.',
      'price': 'From \$1099',
      'image': 'assets/banners/dellxps.png'
    },
    {
      'title': 'ASUS ROG',
      'subtitle': 'Performance beast for gamers.',
      'price': 'From \$1299',
      'image': 'assets/banners/asusrog.jpg'
    },
    {
      'title': 'HP Spectre x360',
      'subtitle': 'Versitile 2 in 1 for creator',
      'price': 'From \$1199',
      'image': 'assets/banners/hpp.jpg'
    },
  
  ];

  void _onNavBarTapped(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ShopScreen()),
      );
      return;
    }
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ProfileScreen()),
      );
      return;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.inter();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset('assets/banners/applogo.png'),
        ),
        centerTitle: true,
        title: Text(
          "LapStore",
          style: textStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            iconSize: 32,
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),  
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: [
                  'assets/banners/banner1.jpg',
                  'assets/banners/banner2.jpg',
                  'assets/banners/banner3.jpg',
                  'assets/banners/macbookk.jpg',
                ]
                    .map((banner) => ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            banner,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  height: MediaQuery.of(context).size.width * 0.5,
                ),
              ),
              const SizedBox(height: 24),
              Padding(padding: EdgeInsets.all(10),
                child: Text(
                  "Categories",
                  style: textStyle.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(padding: EdgeInsets.all(10),
                child: SizedBox(
                  height: 310,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final cat = categories[index];
                      return InkWell(
                        onTap: () {
                          switch (cat['title']) {
                            case 'Apple':
                              Navigator.push(context, MaterialPageRoute(builder: (_) => MacScreen()));
                              break;
                            case 'Dell':
                              Navigator.push(context, MaterialPageRoute(builder: (_) => DellScreen()));
                              break;
                            case 'HP':
                              Navigator.push(context, MaterialPageRoute(builder: (_) => HpScreen()));
                              break;
                            case 'ASUS':
                              Navigator.push(context, MaterialPageRoute(builder: (_) => AsusScreen()));
                              break;
                          }
                        },
                        child: Container(
                          width: 260,
                          margin: const EdgeInsets.only(right: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  cat['image']!,
                                  height: 170,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                "Explore",
                                style: textStyle.copyWith(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                cat['title']!,
                                style: textStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: ElevatedButton(
                                  onPressed: () {
                                    switch (cat['title']) {
                                      case 'Apple':
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => MacScreen()));
                                        break;
                                      case 'Dell':
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => DellScreen()));
                                        break;
                                      case 'HP':
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => HpScreen()));
                                        break;
                                      case 'ASUS':
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => AsusScreen()));
                                        break;
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const StadiumBorder(),
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                  ),
                                  child: Text(
                                    "View",
                                    style: textStyle.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 28),
              Padding(padding: EdgeInsets.all(10),
                child: Text(
                  "Featured",
                  style: textStyle.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(padding: EdgeInsets.all(10),
                child: SizedBox(
                  height: 340,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: featuredLaptops.length,
                    itemBuilder: (context, index) {
                      final laptop = featuredLaptops[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => ShopScreen()),
                          );
                        },
                        child: Container(
                          width: 260,
                          margin: const EdgeInsets.only(right: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                laptop['image']!,
                                height: 130,
                                width: double.infinity,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(height: 12),
                              Text("New",
                                  style: textStyle.copyWith(
                                      color: Colors.grey[600], fontSize: 12)),
                              Text(
                                laptop['title']!,
                                style: textStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                laptop['subtitle']!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: textStyle.copyWith(
                                  color: Colors.grey[800],
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                laptop['price']!,
                                style: textStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              
                              const Spacer(),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onNavBarTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
