// import 'package:flutter/material.dart';

// class FAQScreen extends StatelessWidget {
//   final List<Map<String, String>> faqs = [
//     {
//       "question": "What is the College OLX app?",
//       "answer": "The College OLX app is a marketplace for students to buy and sell used products within their college community."
//     },
//     {
//       "question": "How do I create an account?",
//       "answer": "You can create an account using your college email ID and set up a profile to start buying and selling."
//     },
//     {
//       "question": "Is the app free to use?",
//       "answer": "Yes, the app is completely free for students. However, premium listing options may be introduced in the future."
//     },
//     {
//       "question": "How can I list an item for sale?",
//       "answer": "Go to the 'Sell' section, upload product images, provide a description, set a price, and post your listing."
//     },
//     {
//       "question": "How do I contact a seller?",
//       "answer": "You can use the in-app chat feature to communicate with sellers and negotiate prices."
//     },
//     {
//       "question": "Is my personal information safe?",
//       "answer": "Yes, your data is protected, and only verified college students can access the marketplace."
//     },
//     {
//       "question": "How do I mark an item as sold?",
//       "answer": "Once your item is sold, go to your listing and select 'Mark as Sold' to remove it from active listings."
//     },
//     {
//       "question": "What payment methods are supported?",
//       "answer": "Payments are handled directly between buyers and sellers. We recommend using UPI or cash on delivery for secure transactions."
//     },
//     {
//       "question": "Can I report a user or listing?",
//       "answer": "Yes, if you encounter any suspicious activity, use the 'Report' button on the listing or user profile to notify the admin team."
//     }
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("FAQs"),
//       ),
//       body: ListView.builder(
//         itemCount: faqs.length,
//         itemBuilder: (context, index) {
//           return ExpansionTile(
//             title: Text(faqs[index]["question"]!),
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(faqs[index]["answer"]!),
//               )
//             ],
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FAQScreen extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      "question": "What is the College OLX app?",
      "answer": "The College OLX app is a marketplace for students to buy and sell used products within their college community."
    },
    {
      "question": "How do I create an account?",
      "answer": "You can create an account using your college email ID and set up a profile to start buying and selling."
    },
    {
      "question": "Is the app free to use?",
      "answer": "Yes, the app is completely free for students. However, premium listing options may be introduced in the future."
    },
    {
      "question": "How can I list an item for sale?",
      "answer": "Go to the 'Sell' section, upload product images, provide a description, set a price, and post your listing."
    },
    {
      "question": "How do I contact a seller?",
      "answer": "You can use the in-app chat feature to communicate with sellers and negotiate prices."
    },
    
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQs", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.yellow.shade700,
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: Colors.yellow.shade100, // Soft yellow background
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: faqs.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ExpansionTile(
                leading: SvgPicture.asset(
                  "assets/icons/faq_icon.svg", // Ensure this SVG exists in assets/icons/
                  width: 30,
                  height: 30,
                ),
                title: Text(
                  faqs[index]["question"]!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      faqs[index]["answer"]!,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
