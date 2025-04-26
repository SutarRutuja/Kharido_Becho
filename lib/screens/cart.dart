// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../services/cart_provider.dart';

// class CartPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = Provider.of<CartProvider>(context);

//     return Scaffold(
//       appBar: AppBar(title: Text("My Cart")),
//       body: cartProvider.cartItems.isEmpty
//           ? Center(child: Text("Your cart is empty"))
//           : ListView.builder(
//               itemCount: cartProvider.cartItems.length,
//               itemBuilder: (context, index) {
//                 final product = cartProvider.cartItems[index];
//                 return ListTile(
//                   leading: Image.network(product.image, width: 50),
//                   title: Text(product.name),
//                   subtitle: Text("\$${product.price}"),
//                   trailing: IconButton(
//                     icon: Icon(Icons.remove_circle),
//                     onPressed: () {
//                       cartProvider.removeFromCart(product);
//                     },
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/cart_provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("My Cart")),
      body: cartProvider.cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    // "assets/cart.png", // Add this image to your assets
                    'assets/signup.png',
                    height: 150,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Your cart is empty!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Add items to your cart to see them here.",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final product = cartProvider.cartItems[index];
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Image.network(
                      product.image,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.image_not_supported, size: 60),
                    ),
                    title: Text(product.name, style: TextStyle(fontSize: 16)),
                    subtitle: Text("\$${product.price}",
                        style: TextStyle(fontSize: 14, color: Colors.green)),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle, color: Colors.red),
                      onPressed: () {
                        cartProvider.removeFromCart(product);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
