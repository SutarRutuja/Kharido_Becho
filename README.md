📦 Kharido Becho – College Marketplace App
Kharido Becho is a mobile application designed for college students and faculty to buy and sell new and used products within the campus community.
Built using Flutter and powered by Firebase, the app ensures secure transactions, easy product listings, and seamless user experiences.
<br>
<br>
<br>
✨ Key Features
📋 Product listing, browsing by categories

🔒 Secure Login, Registration, Forgot Password (using Firebase Authentication)

🛒 Cart management and simple checkout flow

🛠️ Admin panel to manage products, users, categories


<br><br><br>

🛠️ Tech Stack
Frontend: Flutter (Dart)

Backend/Database: Firebase (Authentication, Firestore, Storage)

<br><br><br>


🚀 Getting Started
Follow these steps to run Kharido Becho locally on your system:

1. Prerequisites
Install Flutter SDK

Install Android Studio or VS Code with Flutter & Dart extensions

Setup a Firebase Project



2. Clone the Repository
bash
Copy
Edit
git clone https://github.com/your-username/kharido-becho.git
cd kharido-becho
3. Setup Firebase
Create a Firebase project.

Enable Authentication (Email/Password Sign-in method).

Create a Firestore Database and set the rules.

Create a Storage bucket for uploading product images.

Download the google-services.json (for Android) and place it in /android/app/ folder.

(Optional) Download GoogleService-Info.plist (for iOS) and configure accordingly if you are targeting iOS.
<br><br><br>


4. Install Dependencies
bash
Copy
Edit
flutter pub get
5. Run the App
bash
Copy
Edit
flutter run
Or use your IDE's "Run" button to launch on an emulator or a connected device.
<br><br><br>
📋 Project Structure
<br>
lib/<br>
│
├── screens/          # All UI screens (Home, Login, Register, Product Details, Cart)<br>
├── services/         # Firebase services (Authentication, Firestore, Storage)<br>
├── models/           # Data models (User, Product, Cart Item)<br>
├── widgets/          # Reusable widgets (Product Card, Custom Button)<br>
├── providers/        # State management (Provider/ChangeNotifier)<br>
└── main.dart         # App entry point<br>


<br><br><br>
📷 App Flow / Working<br>
🏠 Homepage: Featured products, categorized view.

🔐 User Authentication: Register/Login/Forgot Password handled via Firebase Auth.

🛒 Product Browsing & Details: Browse items, view details, add to cart.

📦 Cart and Checkout: Manage cart and add to cart and chat with the seller for further information.


<br><br><br>
🌱 Contribution Guidelines
We love contributions!

Fork the repository

Create a new branch (git checkout -b feature-branch)

Make changes and commit (git commit -m "Added feature")

Push changes (git push origin feature-branch)

Create a Pull Request (PR)

<br><br><br>

📜 License<br>
This project is licensed under the MIT License.
Feel free to use, modify, and enhance it!
