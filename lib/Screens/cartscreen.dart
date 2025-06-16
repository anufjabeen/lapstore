import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Cart {
  static final List<Map<String, String>> products = [];

  static void add(Map<String, String> product) {
    products.add(product);
  }

  static void clear() {
    products.clear();
  }
}

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.inter();
    final cartProducts = Cart.products;

    // Calculate total
    double total = 0;
    for (final p in cartProducts) {
      // Try to extract number from price like "From $1099"
      final priceString = p['price'] ?? "";
      final match = RegExp(r'(\d+)').firstMatch(priceString);
      if (match != null) {
        total += double.tryParse(match.group(1) ?? "0") ?? 0;
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Your Cart", style: textStyle.copyWith(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.white),
            onPressed: () {
              Cart.clear();
              (context as Element).markNeedsBuild();
            },
            tooltip: "Clear Cart",
          ),
        ],
      ),
      body: cartProducts.isEmpty
          ? Center(
              child: Text("Your cart is empty.",
                  style: textStyle.copyWith(color: Colors.white70, fontSize: 18)),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProducts.length,
                    itemBuilder: (context, index) {
                      final product = cartProducts[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            if (product['image'] != null)
                              Image.asset(
                                product['image']!,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product['title'] ?? "",
                                      style: textStyle.copyWith(
                                          fontWeight: FontWeight.bold, fontSize: 16)),
                                  if (product['subtitle'] != null)
                                    Text(product['subtitle']!,
                                        style: textStyle.copyWith(
                                            fontSize: 12, color: Colors.grey[700])),
                                  Text(product['price'] ?? "",
                                      style: textStyle.copyWith(
                                          fontWeight: FontWeight.bold, fontSize: 15)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // Cart Total and Checkout Button
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Total", style: textStyle.copyWith(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
                          const Spacer(),
                          Text("USD ${total.toStringAsFixed(2)}", style: textStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          ),
                          onPressed: () => _showCheckoutDialog(context, textStyle),
                          child: const Text("Proceed to Checkout", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  void _showCheckoutDialog(BuildContext context, TextStyle textStyle) async {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email ?? "";

    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final addressController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text("Checkout", style: TextStyle(fontWeight: FontWeight.bold)),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: "Full Name"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: "Phone Number"),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(labelText: "Shipping Address"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: email,
                  decoration: const InputDecoration(labelText: "Email"),
                  readOnly: true,
                ),
                const SizedBox(height: 10),
                // Payment option
                Row(
                  children: const [
                    Icon(Icons.attach_money, color: Colors.red),
                    SizedBox(width: 8),
                    Text("Payment: Cash on Delivery", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () { Navigator.pop(context); },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                if (nameController.text.trim().isEmpty ||
                    phoneController.text.trim().isEmpty ||
                    addressController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all required fields!')),
                  );
                  return;
                }
                Navigator.pop(context);
                // Clear cart or save order to Firestore here!
                Cart.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Order placed! Your products are purchased.')),
                );
                (context as Element).markNeedsBuild(); // Refresh cart view
              },
              child: const Text("Place Order"),
            ),
          ],
        );
      },
    );
  }
}
