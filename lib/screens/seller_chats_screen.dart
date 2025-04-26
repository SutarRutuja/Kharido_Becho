import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'chatscreen.dart';

class SellerChatsScreen extends StatelessWidget {
  final String sellerEmail;

  SellerChatsScreen({required this.sellerEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Buyer Chats")),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .where('seller', isEqualTo: sellerEmail)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          var chatDocs = snapshot.data!.docs;
          Map<String, String> buyers = {};

          // Extract unique buyers
          for (var chat in chatDocs) {
            String buyerEmail = chat['buyer'];
            if (!buyers.containsKey(buyerEmail)) {
              buyers[buyerEmail] = buyerEmail;
            }
          }

          if (buyers.isEmpty) {
            return Center(child: Text("No chats available"));
          }

          return ListView(
            children: buyers.values.map((buyerEmail) {
              return ListTile(
                leading: Icon(Icons.chat),
                title: Text(buyerEmail),
                subtitle: Text("Tap to view messages"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        buyerEmail: buyerEmail,
                        sellerEmail: sellerEmail,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
