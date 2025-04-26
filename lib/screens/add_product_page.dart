
// import 'package:flutter/material.dart';
// import '../services/firebase_service.dart';
// import '../services/product_model.dart';

// class AddProductPage extends StatefulWidget {
//   @override
//   _AddProductPageState createState() => _AddProductPageState();
// }

// class _AddProductPageState extends State<AddProductPage> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController sellerController = TextEditingController();
//   final TextEditingController contactController = TextEditingController();
//   final TextEditingController imageUrlController = TextEditingController();
//   final FirebaseService firebaseService = FirebaseService();

//   String? selectedCategory;
//   final List<String> categories = [
//     "Electronics",
//     "Books & Stationaries",
//     "Furniture",
//     "Tickets",
//     "Others"
//   ];

//   void addProduct() async {
//     if (nameController.text.isNotEmpty &&
//         priceController.text.isNotEmpty &&
//         selectedCategory != null &&
//         sellerController.text.isNotEmpty &&
//         contactController.text.isNotEmpty &&
//         imageUrlController.text.isNotEmpty) {
      
//       Product newProduct = Product(
//         name: nameController.text,
//         category: selectedCategory!.toLowerCase(),
//         price: double.tryParse(priceController.text) ?? 0.0,
//         image: imageUrlController.text, // Use entered image URL
//         seller: sellerController.text,
//         contact: contactController.text,
//       );

//       await firebaseService.addProduct(newProduct.toMap());
//       Navigator.pop(context);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("All fields are required!")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Add Product")),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             buildStyledTextField(nameController, "Product Name"),
//             buildStyledTextField(priceController, "Price", keyboardType: TextInputType.number),
            
//             DropdownButtonFormField<String>(
//               value: selectedCategory,
//               decoration: InputDecoration(
//                 labelText: "Category",
//                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//               ),
//               items: categories.map((category) {
//                 return DropdownMenuItem<String>(
//                   value: category,
//                   child: Text(category),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedCategory = value;
//                 });
//               },
//             ),
//             SizedBox(height: 16),

//             buildStyledTextField(imageUrlController, "Image URL"),
            
//             buildStyledTextField(sellerController, "Seller Name"),
//             buildStyledTextField(contactController, "Seller Contact", keyboardType: TextInputType.phone),

//             SizedBox(height: 20),

//             // Submit Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: addProduct,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.purple.shade100,
//                   padding: EdgeInsets.symmetric(vertical: 14),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: Text(
//                   "Submit",
//                   style: TextStyle(fontSize: 16, color: Colors.black),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildStyledTextField(TextEditingController controller, String label, {TextInputType? keyboardType}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextField(
//         controller: controller,
//         keyboardType: keyboardType,
//         decoration: InputDecoration(
//           labelText: label,
//           filled: true,
//           fillColor: Colors.white,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(color: Colors.black, width: 2),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(color: Colors.black, width: 2),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(color: Colors.black, width: 2),
//           ),
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../services/firebase_service.dart';
// import '../services/product_model.dart';

// class AddProductPage extends StatefulWidget {
//   @override
//   _AddProductPageState createState() => _AddProductPageState();
// }

// class _AddProductPageState extends State<AddProductPage> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController contactController = TextEditingController();
//   final TextEditingController imageUrlController = TextEditingController();
//   final FirebaseService firebaseService = FirebaseService();

//   String? selectedCategory;
//   final List<String> categories = [
//     "Electronics",
//     "Books & Stationaries",
//     "Furniture",
//     "Tickets",
//     "Others"
//   ];

//   // Get logged-in user's email
//   final User? user = FirebaseAuth.instance.currentUser;
//   String get sellerEmail => user?.email ?? "unknown_seller@example.com";

//   void addProduct() async {
//     if (nameController.text.isNotEmpty &&
//         priceController.text.isNotEmpty &&
//         selectedCategory != null &&
//         contactController.text.isNotEmpty &&
//         imageUrlController.text.isNotEmpty) {
      
//       Product newProduct = Product(
//         name: nameController.text,
//         category: selectedCategory!.toLowerCase(),
//         price: double.tryParse(priceController.text) ?? 0.0,
//         image: imageUrlController.text,
//         seller: sellerEmail, // Automatically set seller email
//         contact: contactController.text,
//       );

//       await firebaseService.addProduct(newProduct.toMap());
//       Navigator.pop(context);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("All fields are required!")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Add Product")),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             buildStyledTextField(nameController, "Product Name"),
//             buildStyledTextField(priceController, "Price", keyboardType: TextInputType.number),

//             DropdownButtonFormField<String>(
//               value: selectedCategory,
//               decoration: InputDecoration(
//                 labelText: "Category",
//                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//               ),
//               items: categories.map((category) {
//                 return DropdownMenuItem<String>(
//                   value: category,
//                   child: Text(category),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedCategory = value;
//                 });
//               },
//             ),
//             SizedBox(height: 16),

//             buildStyledTextField(imageUrlController, "Image URL"),
//             buildStyledTextField(contactController, "Seller Contact", keyboardType: TextInputType.phone),

//             SizedBox(height: 20),

//             // Submit Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: addProduct,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.purple.shade100,
//                   padding: EdgeInsets.symmetric(vertical: 14),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: Text(
//                   "Submit",
//                   style: TextStyle(fontSize: 16, color: Colors.black),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildStyledTextField(TextEditingController controller, String label, {TextInputType? keyboardType}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextField(
//         controller: controller,
//         keyboardType: keyboardType,
//         decoration: InputDecoration(
//           labelText: label,
//           filled: true,
//           fillColor: Colors.white,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(color: Colors.black, width: 2),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(color: Colors.black, width: 2),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(color: Colors.black, width: 2),
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../services/firebase_service.dart';
// import '../services/product_model.dart';

// class AddProductPage extends StatefulWidget {
//   @override
//   _AddProductPageState createState() => _AddProductPageState();
// }

// class _AddProductPageState extends State<AddProductPage> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController contactController = TextEditingController();
//   final TextEditingController imageUrlController = TextEditingController();
//   final FirebaseService firebaseService = FirebaseService();

//   String? selectedCategory;
//   final List<String> categories = [
//     "Electronics",
//     "Books & Stationaries",
//     "Furniture",
//     "Tickets",
//     "Others"
//   ];

//   // Get logged-in user's email
//   final User? user = FirebaseAuth.instance.currentUser;
//   String get sellerEmail => user?.email ?? "unknown_seller@example.com";

//   void addProduct() async {
//     if (nameController.text.isNotEmpty &&
//         priceController.text.isNotEmpty &&
//         selectedCategory != null &&
//         contactController.text.isNotEmpty &&
//         imageUrlController.text.isNotEmpty) {
      
//       Product newProduct = Product(
//         name: nameController.text,
//         category: selectedCategory!.toLowerCase(),
//         price: double.tryParse(priceController.text) ?? 0.0,
//         image: imageUrlController.text,
//         seller: sellerEmail, // Automatically set seller email
//         contact: contactController.text,
//       );

//       await firebaseService.addProduct(newProduct.toMap());
//       Navigator.pop(context);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("All fields are required!")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Add Product")),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Header Image
//             Image.asset(
//               "assets/add_items.png", // Make sure this image exists in your assets
//               height: 150,
//             ),
//             SizedBox(height: 20),

//             buildStyledTextField(nameController, "Product Name"),
//             buildStyledTextField(priceController, "Price", keyboardType: TextInputType.number),

//             DropdownButtonFormField<String>(
//               value: selectedCategory,
//               decoration: InputDecoration(
//                 labelText: "Category",
//                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//               ),
//               items: categories.map((category) {
//                 return DropdownMenuItem<String>(
//                   value: category,
//                   child: Text(category),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedCategory = value;
//                 });
//               },
//             ),
//             SizedBox(height: 16),

//             buildStyledTextField(imageUrlController, "Image URL"),
//             buildStyledTextField(contactController, "Seller Contact", keyboardType: TextInputType.phone),

//             SizedBox(height: 20),

//             // Submit Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: addProduct,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.black, // Black background
//                   padding: EdgeInsets.symmetric(vertical: 14),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     side: BorderSide(color: Colors.grey.shade700, width: 2), // Light black border
//                   ),
//                 ),
//                 child: Text(
//                   "Submit",
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildStyledTextField(TextEditingController controller, String label, {TextInputType? keyboardType}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextField(
//         controller: controller,
//         keyboardType: keyboardType,
//         decoration: InputDecoration(
//           labelText: label,
//           filled: true,
//           fillColor: Colors.white,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(color: Colors.grey.shade700, width: 2), // Light black border
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(color: Colors.grey.shade700, width: 2),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(color: Colors.grey.shade900, width: 2),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/firebase_service.dart';
import '../services/product_model.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final FirebaseService firebaseService = FirebaseService();

  String? selectedCategory;
  final List<String> categories = [
    // "Electronics",
    // "Books & Stationaries",
    // "Furniture",
    // "Tickets",
    // "Others"
    "Electronics",
    "Books & Stationery",
    "Furniture",
    "Tickets",
    "Others"
  ];

  // Get logged-in user's email
  final User? user = FirebaseAuth.instance.currentUser;
  String get sellerEmail => user?.email ?? "unknown_seller@example.com";

  void addProduct() async {
    if (nameController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        selectedCategory != null &&
        contactController.text.isNotEmpty &&
        imageUrlController.text.isNotEmpty) {
      
      Product newProduct = Product(
        name: nameController.text,
        category: selectedCategory!.toLowerCase(),
        price: double.tryParse(priceController.text) ?? 0.0,
        image: imageUrlController.text,
        seller: sellerEmail, // Automatically set seller email
        contact: contactController.text,
      );

      await firebaseService.addProduct(newProduct.toMap());
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("All fields are required!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Product")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Header Image
            Image.asset(
              "assets/add_items.png", // Make sure this image exists in your assets
              height: 150,
            ),
            SizedBox(height: 20),

            buildStyledTextField(nameController, "Product Name"),
            buildStyledTextField(priceController, "Price", keyboardType: TextInputType.number),

            DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: InputDecoration(
                labelText: "Category",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              items: categories.map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
            ),
            SizedBox(height: 16),

            buildStyledTextField(imageUrlController, "Image URL"),
            buildStyledTextField(contactController, "Seller Contact", keyboardType: TextInputType.phone),

            SizedBox(height: 20),

            // Submit Button
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: addProduct,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Black background
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.grey.shade700, width: 2), // Light black border
                  ),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStyledTextField(TextEditingController controller, String label, {TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade700, width: 2), // Light black border
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade700, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade900, width: 2),
          ),
        ),
      ),
    );
  }
}
