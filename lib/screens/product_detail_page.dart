
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../services/product_model.dart';
// import '../services/cart_provider.dart';

// class ProductDetailsPage extends StatelessWidget {
//   final Product product;

//   ProductDetailsPage({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(product.name)),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(child: Image.network(product.image, height: 200)),
//             SizedBox(height: 16),
//             Text(product.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//             SizedBox(height: 8),
//             Text("Category: ${product.category}", style: TextStyle(fontSize: 18)),
//             SizedBox(height: 8),
//             Text("Price: \$${product.price}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
//             SizedBox(height: 8),
//             Text("Seller: ${product.seller}", style: TextStyle(fontSize: 16)),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Provider.of<CartProvider>(context, listen: false).addToCart(product);
//                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${product.name} added to cart!")));
//               },
//               child: Text("Add to Cart"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../services/product_model.dart';
// import '../services/cart_provider.dart';
// import '../screens/chatscreen.dart'; // Import chat screen

// class ProductDetailsPage extends StatelessWidget {
//   final Product product;

//   ProductDetailsPage({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser; // Get logged-in user

//     return Scaffold(
//       appBar: AppBar(title: Text(product.name)),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(child: Image.network(product.image, height: 200)),
//             SizedBox(height: 16),
//             Text(product.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//             SizedBox(height: 8),
//             Text("Category: ${product.category}", style: TextStyle(fontSize: 18)),
//             SizedBox(height: 8),
//             Text("Price: \$${product.price}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
//             SizedBox(height: 8),
//             Text("Seller: ${product.seller}", style: TextStyle(fontSize: 16)),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Provider.of<CartProvider>(context, listen: false).addToCart(product);
//                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${product.name} added to cart!")));
//               },
//               child: Text("Add to Cart"),
//             ),
//             SizedBox(height: 10),
//             if (user != null && user.email != product.seller) // Ensure user is logged in & not the seller
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ChatScreen(
//                         buyerEmail: user.email!,
//                         sellerEmail: product.seller,
//                       ),
//                     ),
//                   );
//                 },
//                 child: Text("Chat with Seller"),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/product_model.dart';
import '../services/cart_provider.dart';
import '../screens/chatscreen.dart'; // Import chat screen

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser; // Get logged-in user

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(product.image, height: 200)),
            SizedBox(height: 16),
            Text(product.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Category: ${product.category}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Price: \$${product.price}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
            SizedBox(height: 8),
            Text("Seller: ${product.seller}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),

            // Centered Medium-Sized Buttons
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 200, // Medium button width
                    child: ElevatedButton(
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false).addToCart(product);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${product.name} added to cart!")));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black, // Button color black
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(fontSize: 16, color: Colors.white), // White text
                      ),
                    ),
                  ),
                  SizedBox(height: 10), // Space between buttons

                  if (user != null && user.email != product.seller) // Ensure user is logged in & not the seller
                    SizedBox(
                      width: 200, // Medium button width
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                buyerEmail: user.email!,
                                sellerEmail: product.seller,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black, // Button color black
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Chat with Seller",
                          style: TextStyle(fontSize: 16, color: Colors.white), // White text
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
