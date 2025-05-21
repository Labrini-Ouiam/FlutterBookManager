# 📚 Flutter Book Manager

A Flutter application for searching books using Google Books API and managing favorites with local storage.

![image](https://github.com/user-attachments/assets/23c6a407-279e-4b18-ac4a-5d70fbbe8de6)


## ✨ Features
- 🔍 Search books using Google Books API
- ❤️ Add/remove books from favorites
- 💾 Local storage with SQLite (mobile) and Hive (web)
- 🌐 Cross-platform (Android, iOS, Web)
- 🖼️ Book cover display with fallback

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (version 3.0 or higher)
- Dart SDK (version 2.19 or higher)

### Installation
1. Clone the repository:
```bash
git clone https://github.com/Labrini-Ouiam/FlutterBookManager.git
cd FlutterBookManager
Install dependencies:

bash
flutter pub get
Generate Hive adapters:

bash
flutter pub run build_runner build
Run the app:

bash
flutter run

📦 Dependencies
Package	Version	Usage
flutter_bloc	^8.1.2	State management
http	^0.13.5	API calls
sqflite	^2.2.8	Mobile database
hive	^2.2.3	Web database
flutter_dotenv	^5.1.0	Environment variables
⚙ Configuration
Create a .env file in the root directory:

env
GOOGLE_BOOKS_API_KEY=your_api_key_here
For web support, add to web/index.html:

html
<meta http-equiv="Content-Security-Policy" 
      content="default-src 'self' https://*.googleapis.com">
📄 License
This project is licensed under the MIT License - see the LICENSE file for details.

Made with ❤️ by Labrini Ouiam
