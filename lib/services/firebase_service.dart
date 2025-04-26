// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../services/product_model.dart';

// class FirebaseService {
//   final CollectionReference _productCollection =
//       FirebaseFirestore.instance.collection('products');

//   // ✅ Convert Product object to Map before storing it in Firestore
//   Future<void> addProduct(Map<String, dynamic> product) async {
//     await _productCollection.add(product);
//   }

//   // ✅ Convert Firestore document back into Product model
//   Stream<List<Product>> getProducts() {
//     return _productCollection.snapshots().map((snapshot) {
//       return snapshot.docs
//           .map((doc) => Product.fromMap(doc.data() as Map<String, dynamic>))
//           .toList();
//     });
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import '../services/product_model.dart';

class FirebaseService {
  final CollectionReference _productCollection =
      FirebaseFirestore.instance.collection('products');
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // ✅ Add Product to Firestore
  Future<void> addProduct(Map<String, dynamic> product) async {
    await _productCollection.add(product);
  }

  // ✅ Retrieve Products as a Stream
  Stream<List<Product>> getProducts() {
    return _productCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Product.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }

  // ✅ Upload Image to Firebase Storage and return the URL
//   Future<String> uploadImage(File imageFile) async {
//     try {
//       String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//       Reference storageRef = _storage.ref().child("product_images/$fileName");

//       UploadTask uploadTask = storageRef.putFile(imageFile);
//       TaskSnapshot snapshot = await uploadTask;
//       String downloadUrl = await snapshot.ref.getDownloadURL();

//       return downloadUrl;
//     } catch (e) {
//       print("Error uploading image: $e");
//       return "";
//     }
//   }
 }