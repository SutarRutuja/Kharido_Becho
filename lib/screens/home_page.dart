// import 'package:flutter/material.dart';
// import '../services/firebase_service.dart';
// import '../services/product_model.dart';
// import 'package:pbl/screens/add_product_page.dart';
// import 'package:pbl/screens/about_us.dart';
// import 'package:pbl/screens/profile_page.dart';

// class HomePage extends StatelessWidget {
//   final FirebaseService firebaseService = FirebaseService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("E-Commerce Home"),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(color: Colors.blue),
//               child: Text(
//                 "Menu",
//                 style: TextStyle(color: Colors.white, fontSize: 24),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.info),
//               title: Text("About Us"),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => AboutUsPage()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.person),
//               title: Text("Profile"),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ProfilePage()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       body: StreamBuilder<List<Product>>(
//         stream: firebaseService.getProducts(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text("No products found"));
//           }
//           final products = snapshot.data!;

//           // Group products by category
//           Map<String, List<Product>> categorizedProducts = {};
//           for (var product in products) {
//             if (!categorizedProducts.containsKey(product.category)) {
//               categorizedProducts[product.category] = [];
//             }
//             categorizedProducts[product.category]!.add(product);
//           }

//           return ListView(
//             children: categorizedProducts.entries.map((entry) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text(
//                       entry.key,
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   ...entry.value.map((product) => ListTile(
//                         leading: Image.network(product.image, width: 50),
//                         title: Text(product.name),
//                         subtitle: Text("Price: \$${product.price}\nSeller: ${product.seller}"),
//                       ))
//                 ],
//               );
//             }).toList(),
//           );
//         },
//       ),
//      floatingActionButton: FloatingActionButton.extended(
//   onPressed: () => Navigator.push(
//     context,
//     MaterialPageRoute(builder: (_) => AddProductPage()),
//   ),
//   icon: Icon(Icons.add),
//   label: Text("Sell Product",
//   style: TextStyle(color: Colors.white),
//   ),
 
  
//   backgroundColor: const Color.fromARGB(255, 157, 114, 186), // Optional: change color
// ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../services/firebase_service.dart';
import '../services/product_model.dart';
import 'add_product_page.dart';
import 'about_us.dart';
import 'profile_page.dart';
import '../screens/product_detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseService firebaseService = FirebaseService();
  String selectedCategory = "All"; // Default to show all products

  final List<String> categories = [
    "All",
    "Electronics",
    "Books & Stationery",
    "Furniture",
    "Tickets"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("E-Commerce Home")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Menu", style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About Us"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsPage())),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage())),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Category Selection Section
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.map((category) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: selectedCategory == category ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        color: selectedCategory == category ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          SizedBox(height: 10),

          // Products Display Section
          Expanded(
            child: StreamBuilder<List<Product>>(
              stream: firebaseService.getProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("No products found"));
                }
                final products = snapshot.data!;

                // Convert category names to lowercase for consistent comparison
                Map<String, List<Product>> categorizedProducts = {
                  "electronics": [],
                  "books & stationery": [],
                  "furniture": [],
                  "tickets": []
                };

                for (var product in products) {
                  String productCategory = product.category.toLowerCase().trim();
                  if (categorizedProducts.containsKey(productCategory)) {
                    categorizedProducts[productCategory]!.add(product);
                  }
                }

                // Filter products based on selected category
                List<Product> displayedProducts = selectedCategory == "All"
                    ? products
                    : categorizedProducts[selectedCategory.toLowerCase()] ?? [];

                return displayedProducts.isEmpty
                    ? Center(child: Text("No products found in this category"))
                    : ListView.builder(
                        itemCount: displayedProducts.length,
                        itemBuilder: (context, index) {
                          final product = displayedProducts[index];
                          return ListTile(
                            leading: Image.network(product.image, width: 50),
                            title: Text(product.name),
                            subtitle: Text("Price: \$${product.price}\nSeller: ${product.seller}"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsPage(product: product),
                                ),
                              );
                            },
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AddProductPage())),
        icon: Icon(Icons.add),
        label: Text("Sell Product", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 157, 114, 186),
      ),
    );
  }
}
