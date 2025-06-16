// import 'package:flutter/material.dart';
// import 'package:velocity_x/velocity_x.dart';

// class CustomizationScreen extends StatefulWidget {
//   final String baseModelName;
//   final double basePrice;

//   CustomizationScreen({required this.baseModelName, required this.basePrice});

//   @override
//   _CustomizationScreenState createState() => _CustomizationScreenState();
// }

// class _CustomizationScreenState extends State<CustomizationScreen> {
//   // Options with extra price
//   final ramOptions = {'8GB': 0, '16GB': 6000, '32GB': 12000};
//   final storageOptions = {'256GB SSD': 0, '512GB SSD': 8000, '1TB HDD': 5000};
//   final processorOptions = {'i5': 0, 'i7': 15000, 'Ryzen 5': 5000, 'Ryzen 7': 12000};
//   final gpuOptions = {'Integrated': 0, 'GTX 1650': 15000, 'RTX 3050': 30000};
//   final osOptions = {'Windows 11': 0, 'Linux': -2000};
//   final accessoriesOptions = {'Bag': 2000, 'Mouse': 1500, 'Warranty': 3000};

//   // Selections
//   String selectedRam = '8GB';
//   String selectedStorage = '256GB SSD';
//   String selectedProcessor = 'i5';
//   String selectedGpu = 'Integrated';
//   String selectedOS = 'Windows 11';
//   Set<String> selectedAccessories = {};

//   double calculateTotalPrice() {
//     double price = widget.basePrice +
//         ramOptions[selectedRam]! +
//         storageOptions[selectedStorage]! +
//         processorOptions[selectedProcessor]! +
//         gpuOptions[selectedGpu]! +
//         osOptions[selectedOS]!;

//     for (var acc in selectedAccessories) {
//       price += accessoriesOptions[acc]!;
//     }

//     return price;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Vx.gray200,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: "Customize ${widget.baseModelName}".text.xl2.bold.black.make(),
//         iconTheme: IconThemeData(color: Colors.black87),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: VStack([
//           // RAM
//           "RAM".text.semiBold.xl.make(),
//           DropdownButton<String>(
//             value: selectedRam,
//             onChanged: (value) => setState(() => selectedRam = value!),
//             items: ramOptions.keys.map((ram) => DropdownMenuItem(value: ram, child: ram.text.make())).toList(),
//           ).box.white.roundedLg.p8.make(),

//           10.heightBox,
//           // Storage
//           "Storage".text.semiBold.xl.make(),
//           DropdownButton<String>(
//             value: selectedStorage,
//             onChanged: (value) => setState(() => selectedStorage = value!),
//             items: storageOptions.keys.map((s) => DropdownMenuItem(value: s, child: s.text.make())).toList(),
//           ).box.white.roundedLg.p8.make(),

//           10.heightBox,
//           // Processor
//           "Processor".text.semiBold.xl.make(),
//           DropdownButton<String>(
//             value: selectedProcessor,
//             onChanged: (value) => setState(() => selectedProcessor = value!),
//             items: processorOptions.keys.map((p) => DropdownMenuItem(value: p, child: p.text.make())).toList(),
//           ).box.white.roundedLg.p8.make(),

//           10.heightBox,
//           // GPU
//           "Graphics Card".text.semiBold.xl.make(),
//           DropdownButton<String>(
//             value: selectedGpu,
//             onChanged: (value) => setState(() => selectedGpu = value!),
//             items: gpuOptions.keys.map((g) => DropdownMenuItem(value: g, child: g.text.make())).toList(),
//           ).box.white.roundedLg.p8.make(),

//           10.heightBox,
//           // OS
//           "Operating System".text.semiBold.xl.make(),
//           DropdownButton<String>(
//             value: selectedOS,
//             onChanged: (value) => setState(() => selectedOS = value!),
//             items: osOptions.keys.map((o) => DropdownMenuItem(value: o, child: o.text.make())).toList(),
//           ).box.white.roundedLg.p8.make(),

//           10.heightBox,
//           // Accessories
//           "Accessories".text.semiBold.xl.make(),
//           Wrap(
//             spacing: 10,
//             children: accessoriesOptions.keys.map((acc) {
//               return FilterChip(
//                 label: acc.text.make(),
//                 selected: selectedAccessories.contains(acc),
//                 onSelected: (isSelected) {
//                   setState(() {
//                     isSelected ? selectedAccessories.add(acc) : selectedAccessories.remove(acc);
//                   });
//                 },
//               );
//             }).toList(),
//           ),

//           20.heightBox,

//           // Summary
//           VStack([
//             "Summary".text.xl.semiBold.make(),
//             "${widget.baseModelName}".text.sm.make(),
//             "RAM: $selectedRam".text.sm.make(),
//             "Storage: $selectedStorage".text.sm.make(),
//             "Processor: $selectedProcessor".text.sm.make(),
//             "Graphics: $selectedGpu".text.sm.make(),
//             "OS: $selectedOS".text.sm.make(),
//             "Accessories: ${selectedAccessories.join(', ')}".text.sm.make(),
//             10.heightBox,
//             "Total: Rs. ${calculateTotalPrice().toStringAsFixed(0)}".text.xl2.bold.make(),
//           ]).box.white.roundedLg.p16.shadowSm.make(),

//           20.heightBox,
//           // Add to Cart Button
//           ElevatedButton.icon(
//             onPressed: () {
//               // TODO: Add to cart logic
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                 content: Text("Laptop added to cart"),
//               ));
//             },
//             icon: Icon(Icons.add_shopping_cart),
//             label: "Add to Cart".text.make(),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Vx.teal600,
//               padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             ),
//           ).centered()
//         ]),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CustomizeLaptopScreen extends StatelessWidget {
  final Map<String, String> laptop;

  const CustomizeLaptopScreen({super.key, required this.laptop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customize ${laptop['title']}"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "Customization screen for ${laptop['title']}",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
