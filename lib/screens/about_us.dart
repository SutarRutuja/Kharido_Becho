import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Us")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About Our E-Commerce App",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Welcome to our platform, where buyers and sellers come together to trade a variety of products seamlessly. "
              "Our goal is to provide an easy, secure, and efficient shopping experience for all users.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              "Features:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text("✔ Buy and sell products with ease"),
            Text("✔ Categorized product listings"),
            Text("✔ Secure transactions"),
            Text("✔ User-friendly interface"),
            SizedBox(height: 10),
            Text(
              "Contact Us: support@ecommerceapp.com",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
