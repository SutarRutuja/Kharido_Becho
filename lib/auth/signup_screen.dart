// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../screens/home_page.dart';

// class SignupScreen extends StatefulWidget {
//   @override
//   _SignupScreenState createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController contactController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   void signUp() async {
//     try {
//       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );

//       // Store additional user info in Firestore
//       await _firestore.collection("users").doc(userCredential.user!.uid).set({
//         "name": nameController.text.trim(),
//         "contact": contactController.text.trim(),
//         "email": emailController.text.trim(),
//         "uid": userCredential.user!.uid,
//       });

//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Signup Failed: $e")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFFFF5C2), // Same background color as login
//       appBar: AppBar(
//         title: Text("Sign Up"),
//         backgroundColor: Color(0xFFFFC107), // Same AppBar color as login
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             children: [
//               SizedBox(height: 20),
//               _buildTextField(nameController, "Full Name"),
//               SizedBox(height: 10),
//               _buildTextField(contactController, "Contact Number", isPhone: true),
//               SizedBox(height: 10),
//               _buildTextField(emailController, "Email"),
//               SizedBox(height: 10),
//               _buildTextField(passwordController, "Password", isPassword: true),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: signUp,
//                 child: Text("Sign Up"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.black, // Black button
//                   foregroundColor: Colors.white, // White text
//                   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(TextEditingController controller, String label, {bool isPassword = false, bool isPhone = false}) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: label,
//         fillColor: Colors.white,
//         filled: true,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8), // Rounded corners
//           // Remove default border
//         ),
        
//         contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       ),
//       obscureText: isPassword,
//       keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/home_page.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void signUp() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Store additional user info in Firestore
      await _firestore.collection("users").doc(userCredential.user!.uid).set({
        "name": nameController.text.trim(),
        "contact": contactController.text.trim(),
        "email": emailController.text.trim(),
        "uid": userCredential.user!.uid,
      });

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Signup Failed: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF5C2), // Same background color as login
      appBar: AppBar(
        title: Text("Sign Up"),
        backgroundColor: Color(0xFFFFC107), // Same AppBar color as login
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 20),

              // ✅ ADD IMAGE HERE
              Image.asset(
                'assets/signup.png',
                height: 180, // Adjust size as needed
                fit: BoxFit.contain, // Adjust the image fit
              ),

              SizedBox(height: 20),
              _buildTextField(nameController, "Full Name"),
              SizedBox(height: 10),
              _buildTextField(contactController, "Contact Number", isPhone: true),
              SizedBox(height: 10),
              _buildTextField(emailController, "Email"),
              SizedBox(height: 10),
              _buildTextField(passwordController, "Password", isPassword: true),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: signUp,
                child: Text("Sign Up"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Black button
                  foregroundColor: Colors.white, // White text
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {bool isPassword = false, bool isPhone = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
           
         
        ),
        
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      obscureText: isPassword,
      keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
    );
  }
}
