// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'cartscreen.dart';

// class ShopScreen extends StatelessWidget {
//   final List<Map<String, String>> featuredLaptops = [
//     {
//       'title': 'MacBook Air',
//       'subtitle': 'Supercharged by the M3 chip. Built for Apple Intelligence.°',
//       'price': 'From \$999',
//       'image': 'assets/banners/macbookair.jpeg'
//     },
//     {
//       'title': 'ASUS ROG',
//       'subtitle': 'Performance beast for gamers.',
//       'price': 'From \$1299',
//       'image': 'assets/banners/asusrog.jpg'
//     },
//     {
//       'title': 'Dell XPS',
//       'subtitle': 'Sleek performance for professionals.',
//       'price': 'From \$1099',
//       'image': 'assets/banners/dellxps.png'
//     },
//   ];

//   final Map<String, List<Map<String, String>>> allLaptopsByCategory = {
//     'Apple': [
//       {
//         'title': 'MacBook Air M3',
//         'subtitle': 'Light, powerful, and efficient.',
//         'price': 'From \$1099',
//         'image': 'assets/images/macbook_air.jpg'
//       },
//       {
//         'title': 'MacBook Pro M3',
//         'subtitle': 'Ultimate pro performance.',
//         'price': 'From \$1999',
//         'image': 'assets/images/macbook_pro.jpg'
//       },
//       {
//         'title': 'MacBook Air M2',
//         'subtitle': 'Proven Apple power.',
//         'price': 'From \$999',
//         'image': 'assets/images/macbook_air_m2.jpg'
//       },
//       {
//         'title': 'MacBook Pro M2',
//         'subtitle': 'For creative professionals.',
//         'price': 'From \$1799',
//         'image': 'assets/images/macbook_pro_m2.jpg'
//       },
//     ],
//     'Dell': [
//       {
//         'title': 'Dell XPS 13',
//         'subtitle': 'Compact power for all-day work.',
//         'price': 'From \$999',
//         'image': 'assets/images/xps.jpg'
//       },
//       {
//         'title': 'Dell Alienware',
//         'subtitle': 'Legendary gaming powerhouse.',
//         'price': 'From \$1799',
//         'image': 'assets/images/alienware.jpg'
//       },
//       {
//         'title': 'Dell Inspiron 15',
//         'subtitle': 'Everyday performance.',
//         'price': 'From \$799',
//         'image': 'assets/images/inspiron.jpg'
//       },
//       {
//         'title': 'Dell Vostro',
//         'subtitle': 'Business essential.',
//         'price': 'From \$899',
//         'image': 'assets/images/vostro.jpg'
//       },
//     ],
//     'HP': [
//       {
//         'title': 'HP Spectre x360',
//         'subtitle': 'Versatile 2-in-1 for creators.',
//         'price': 'From \$1199',
//         'image': 'assets/images/hp_spectre.jpg'
//       },
//       {
//         'title': 'HP Omen 16',
//         'subtitle': 'Built for high performance gaming.',
//         'price': 'From \$1399',
//         'image': 'assets/images/hp_omen.jpg'
//       },
//       {
//         'title': 'HP Pavilion',
//         'subtitle': 'Affordable, reliable.',
//         'price': 'From \$799',
//         'image': 'assets/images/hp_pavilion.jpg'
//       },
//       {
//         'title': 'HP Envy',
//         'subtitle': 'Stylish and powerful.',
//         'price': 'From \$1099',
//         'image': 'assets/images/hp_envy.jpg'
//       },
//     ],
//     'ASUS': [
//       {
//         'title': 'ASUS ROG Zephyrus',
//         'subtitle': 'For serious gamers.',
//         'price': 'From \$1399',
//         'image': 'assets/images/rog.jpg'
//       },
//       {
//         'title': 'ASUS TUF Gaming',
//         'subtitle': 'Durable, budget gaming.',
//         'price': 'From \$1199',
//         'image': 'assets/images/tuf.jpg'
//       },
//       {
//         'title': 'ASUS Vivobook',
//         'subtitle': 'Sleek, everyday productivity.',
//         'price': 'From \$899',
//         'image': 'assets/images/vivobook.jpg'
//       },
//       {
//         'title': 'ASUS Zenbook',
//         'subtitle': 'Premium build and style.',
//         'price': 'From \$1099',
//         'image': 'assets/images/zenbook.jpg'
//       },
//     ],
//   };

//   @override
//   Widget build(BuildContext context) {
//     final textStyle = GoogleFonts.inter();

//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text(
//           'Shop',
//           style: textStyle.copyWith(color: Colors.white),
//         ),
//         iconTheme: IconThemeData(color: Colors.white),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.shopping_cart, color: Colors.white),
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (_) => CartScreen()));
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Featured",
//               style: textStyle.copyWith(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 12),
//             SizedBox(
//               height: 340,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: featuredLaptops.length,
//                 itemBuilder: (context, index) {
//                   final laptop = featuredLaptops[index];
//                   return Container(
//                     width: 260,
//                     margin: const EdgeInsets.only(right: 16),
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image.asset(
//                           laptop['image']!,
//                           height: 120,
//                           width: double.infinity,
//                           fit: BoxFit.contain,
//                         ),
//                         const SizedBox(height: 12),
//                         Text("New",
//                             style: textStyle.copyWith(
//                                 color: Colors.grey[600], fontSize: 12)),
//                         Text(
//                           laptop['title']!,
//                           style: textStyle.copyWith(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           laptop['subtitle']!,
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: textStyle.copyWith(
//                             color: Colors.grey[800],
//                             fontSize: 13,
//                           ),
//                         ),
//                         const SizedBox(height: 6),
//                         Text(
//                           laptop['price']!,
//                           style: textStyle.copyWith(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         Align(
//                           alignment: Alignment.bottomRight,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               Cart.add(laptop);
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(content: Text("${laptop['title']} added to cart!")));
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.black,
//                               shape: const StadiumBorder(),
//                               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//                             ),
//                             child: Text("Buy",
//                                 style: textStyle.copyWith(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold)),
//                           ),
//                         )
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: 28),
//             ...allLaptopsByCategory.entries.map((entry) {
//               final category = entry.key;
//               final laptops = entry.value;
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     category,
//                     style: textStyle.copyWith(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   ...laptops.map((laptop) => Container(
//                     margin: const EdgeInsets.only(bottom: 16),
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Row(
//                       children: [
//                         Image.asset(
//                           laptop['image']!,
//                           width: 80,
//                           height: 80,
//                           fit: BoxFit.cover,
//                         ),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 laptop['title']!,
//                                 style: textStyle.copyWith(
//                                     fontSize: 16, fontWeight: FontWeight.bold),
//                               ),
//                               const SizedBox(height: 4),
//                               Text(
//                                 laptop['subtitle'] ?? '',
//                                 style: textStyle.copyWith(
//                                     fontSize: 13, color: Colors.grey[800]),
//                               ),
//                               const SizedBox(height: 4),
//                               Text(
//                                 laptop['price']!,
//                                 style: textStyle.copyWith(
//                                     fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
//                               ),
//                               const SizedBox(height: 6),
//                               Row(
//                                 children: [
//                                   ElevatedButton(
//                                     onPressed: () {
//                                       Cart.add(laptop);
//                                       ScaffoldMessenger.of(context).showSnackBar(
//                                           SnackBar(content: Text("${laptop['title']} added to cart!")));
//                                     },
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.black,
//                                       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
//                                     child: Text('Buy', style: textStyle.copyWith(color: Colors.white)),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   )),
//                   const SizedBox(height: 20),
//                 ],
//               );
//             }).toList(),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'cartscreen.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  late Future<List<Map<String, dynamic>>> _futureProducts;

  @override
  void initState() {
    super.initState();
    _futureProducts = fetchProductsFromFirestore();
  }

  Future<List<Map<String, dynamic>>> fetchProductsFromFirestore() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('products').get();

    // Get all products as a list of Map<String, dynamic>
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.inter();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Shop', style: textStyle.copyWith(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Loading
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // No data
            return Center(
                child: Text("No products found.",
                    style: textStyle.copyWith(
                        color: Colors.white70, fontSize: 18)));
          }
          final products = snapshot.data!;

          // --- Separate featured products and categories ---
          // For demo, take first 3 as featured, and categorize by 'category'
          final featured = products.take(3).toList();

          // Group by category
          final Map<String, List<Map<String, dynamic>>> byCategory = {};
          for (var product in products) {
            final category = product['category'] ?? 'Other';
            byCategory.putIfAbsent(category, () => []).add(product);
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Featured",
                  style: textStyle.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 340,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: featured.length,
                    itemBuilder: (context, index) {
                      final laptop = featured[index];
                      return Container(
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
                            if (laptop['image'] != null)
                              Image.network(
                                laptop['image']
                                        .toString()
                                        .startsWith("http")
                                    ? laptop['image']
                                    : 'https://via.placeholder.com/200',
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            const SizedBox(height: 12),
                            Text("New",
                                style: textStyle.copyWith(
                                    color: Colors.grey[600], fontSize: 12)),
                            Text(
                              laptop['title'] ?? '',
                              style: textStyle.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              laptop['subtitle'] ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyle.copyWith(
                                color: Colors.grey[800],
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              laptop['price'] ?? '',
                              style: textStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  Cart.add(Map<String, String>.from(laptop));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "${laptop['title']} added to cart!")),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: const StadiumBorder(),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                ),
                                child: Text("Buy",
                                    style: textStyle.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 28),
                // --- By Category ---
                ...byCategory.entries.map((entry) {
                  final category = entry.key;
                  final laptops = entry.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category,
                        style: textStyle.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ...laptops.map((laptop) => Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                if (laptop['image'] != null)
                                  Image.network(
                                    laptop['image']
                                            .toString()
                                            .startsWith("http")
                                        ? laptop['image']
                                        : 'https://via.placeholder.com/200',
                                    width: 100,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        laptop['title'] ?? '',
                                        style: textStyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        laptop['subtitle'] ?? '',
                                        style: textStyle.copyWith(
                                            fontSize: 13,
                                            color: Colors.grey[800]),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        laptop['price'] ?? '',
                                        style: textStyle.copyWith(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 6),
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Cart.add(
                                                  Map<String, String>.from(
                                                      laptop));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                    content: Text(
                                                        "${laptop['title']} added to cart!")),
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black,
                                                padding: const EdgeInsets
                                                        .symmetric(
                                                    horizontal: 16,
                                                    vertical: 8)),
                                            child: Text('Buy',
                                                style: textStyle.copyWith(
                                                    color: Colors.white)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(height: 20),
                    ],
                  );
                }).toList(),
              ],
            ),
          );
        },
      ),
    );
  }
}
