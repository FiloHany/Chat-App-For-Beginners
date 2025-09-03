# Chat App

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Firebase](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white)](https://firebase.google.com/)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)

A modern, real-time chat application built with Flutter and Firebase, featuring secure user authentication and seamless messaging capabilities.

## 📋 Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Screenshots](#screenshots)
- [Installation](#installation)
- [Firebase Setup](#firebase-setup)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [FAQ & Troubleshooting](#faq--troubleshooting)
- [License](#license)
- [Contact & Support](#contact--support)

## ✨ Features

- **🔐 Secure Authentication**: User registration and login with Firebase Authentication
- **💬 Real-time Messaging**: Instant message delivery using Firebase Firestore
- **🎨 Custom UI Components**: Beautiful chat bubbles, custom text fields, and buttons
- **📱 Responsive Design**: Optimized for both Android and iOS devices
- **⚡ Loading Indicators**: Smooth user experience with progress indicators
- **🚨 Error Handling**: Comprehensive error messages and validation
- **🎯 Custom Fonts**: Pacifico font for branding and visual appeal
- **🖼️ Asset Management**: Organized image and font assets

## 🛠️ Tech Stack

- **Framework**: Flutter (Dart SDK ^3.5.3)
- **Backend**: Firebase
  - Authentication for user management
  - Firestore for real-time database
- **UI Components**:
  - Custom widgets for chat interface
  - Material Design components
- **Additional Libraries**:
  - `modal_progress_hud_nsn` for loading overlays
  - `cupertino_icons` for iOS-style icons

## 📸 Screenshots

### Login Screen
![Login Screen](assets/images/scholar.png)
*Secure login with email and password authentication*

### Chat Interface
*Real-time messaging with custom chat bubbles and user avatars*

### Signup Screen
*User registration with validation and error handling*

## 🚀 Installation

### Prerequisites

- Flutter SDK (^3.5.3) - [Installation Guide](https://flutter.dev/docs/get-started/install)
- Dart SDK (^3.5.3)
- Android Studio or VS Code with Flutter extensions
- Firebase account

### Clone the Repository

```bash
git clone https://github.com/your-username/chat_app.git
cd chat_app
```

### Install Dependencies

```bash
flutter pub get
```

### Run the App

```bash
flutter run
```

## 🔥 Firebase Setup

1. **Create a Firebase Project**:
   - Go to [Firebase Console](https://console.firebase.google.com/)
   - Create a new project or select existing one

2. **Enable Authentication**:
   - Navigate to Authentication > Sign-in method
   - Enable Email/Password provider

3. **Set up Firestore**:
   - Go to Firestore Database
   - Create a database in production mode
   - Set up security rules (optional for development)

4. **Add Firebase to Flutter**:
   - Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Place files in respective directories:
     - Android: `android/app/src/main/`
     - iOS: `ios/Runner/`

5. **Configure Firebase Options**:
   - Run: `flutterfire configure`
   - Select your Firebase project
   - This generates `firebase_options.dart`

## 📖 Usage

1. **Launch the App**:
   - Run `flutter run` in terminal
   - Select target device (Android/iOS emulator or physical device)

2. **Sign Up**:
   - Create a new account with email and password
   - Validation ensures strong passwords and valid emails

3. **Log In**:
   - Use existing credentials to access the chat
   - Automatic navigation to chat interface upon successful login

4. **Start Chatting**:
   - Send messages in real-time
   - Messages appear instantly for all users
   - Custom chat bubbles distinguish your messages from others

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point and routing
├── constants.dart            # App-wide constants and colors
├── firebase_options.dart     # Firebase configuration
├── screens/
│   ├── login_page.dart       # User login screen
│   ├── signup_page.dart      # User registration screen
│   └── chat_page.dart        # Main chat interface
├── widgets/
│   ├── custom_text_field.dart # Reusable text input widget
│   ├── custome_button.dart    # Custom button component
│   └── chat_bubble.dart      # Chat message bubble widget
├── models/
│   └── message.dart          # Message data model
└── helper/
    └── show_snak_bar.dart    # Snackbar utility functions

assets/
├── images/
│   └── scholar.png          # App logo
└── fonts/
    └── Pacifico-Regular.ttf # Custom font

android/                      # Android-specific configuration
ios/                          # iOS-specific configuration
```

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature-name`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin feature/your-feature-name`
5. Open a Pull Request

### Development Guidelines

- Follow Flutter best practices and conventions
- Write clear, concise commit messages
- Test on both Android and iOS platforms
- Ensure code is properly formatted with `flutter format`

## ❓ FAQ & Troubleshooting

### Q: I forgot my password. How can I reset it?
A: Currently, password reset functionality is not implemented. Please contact support or create a new account.

### Q: The app crashes on startup. What should I do?
A: Ensure you have the latest Flutter SDK and dependencies installed. Run `flutter clean` and `flutter pub get` before rebuilding.

### Q: How do I contribute to this project?
A: See the [Contributing](#🤝-contributing) section above for guidelines.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 📞 Contact & Support

For questions, issues, or feature requests, please open an issue on the GitHub repository or contact the maintainer at:

- Email: feloh64@gmail.com
- GitHub: [https://github.com/FiloHany](https://github.com/FiloHany)

---

**Built with ❤️ using Flutter and Firebase**
