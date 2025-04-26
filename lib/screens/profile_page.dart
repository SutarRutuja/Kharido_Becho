// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../services/cart_provider.dart';
// import '../auth/logout.dart';
// import 'cart.dart';
// import 'faq.dart'; // Import FAQ page

// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = Provider.of<CartProvider>(context);
//     final user = FirebaseAuth.instance.currentUser; // Get current user

//     return Scaffold(
//       appBar: AppBar(title: Text("Profile")),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: user?.photoURL != null
//                   ? NetworkImage(user!.photoURL!) // If user has a profile picture
//                   : AssetImage("assets/user_profile.png") as ImageProvider, // Default image
//             ),
//             SizedBox(height: 10),
//             Text(
//               user?.displayName ?? "Rutuja", // Display name
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 5),
//             Text(
//               user?.email ?? "user@example.com", // Display email
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//             SizedBox(height: 20),
//             ListTile(
//               leading: Icon(Icons.shopping_cart),
//               title: Text("My Cart (${cartProvider.cartItems.length})"),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => CartPage()),
//                 );
//               },  
//             ),
//             ListTile(
//               leading: Icon(Icons.help_outline),
//               title: Text("FAQs"),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => FAQScreen()), // Navigate to FAQ screen
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.logout),
//               title: Text("Logout"),
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) => LogoutPage(),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/chatscreen.dart';
// have to adder seller chat scren
import '../screens/seller_chats_screen.dart';
import '../services/cart_provider.dart';
import '../auth/logout.dart';
import 'cart.dart';
import 'faq.dart';
import 'package:provider/provider.dart';
 

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: user?.photoURL != null
                  ? NetworkImage(user!.photoURL!)
                  : AssetImage("assets/user_profile.png") as ImageProvider,
            ),
            SizedBox(height: 10),
            Text(user?.displayName ?? "User", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(user?.email ?? "user@example.com", style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 20),

            ListTile(
              leading: Icon(Icons.message),
              title: Text("Chats"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SellerChatsScreen(sellerEmail: user!.email!)),
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text("My Cart (${cartProvider.cartItems.length})"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
              },
            ),

            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text("FAQs"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FAQScreen()));
              },
            ),

            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                showDialog(context: context, builder: (context) => LogoutPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}

