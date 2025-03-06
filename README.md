# 🚀 TaskMaster Test Project by Package.ai

## 📖 Overview
A brief introduction to your project. Explain its purpose, features, and any unique aspects.

## 📂 Project Structure
- **Architecture:** Architecture: MVVM (Model-View-ViewModel).
- **State Management:** Riverpod.
- **Networking:** Dio for API handling.
- **Local Storage:** Hive for data persistence.
- **Navigation:** GoRouter for routing.
- **Framework:** Latest Flutter version

## 🛠 Setup and Run Instructions

### 🔹 Prerequisites
Ensure you have the following installed:
- [Flutter](https://docs.flutter.dev/get-started/install)
- Dart SDK (included with Flutter)
- Emulator or real device
- Add .env file with API keys

### 🔹 Installation Steps
```sh
# Clone the repository
git clone https://github.com/your-username/your-repo.git
cd your-repo

# Install dependencies
flutter pub get

# Run the app (choose platform)
flutter run       # Mobile
```

### ⚠️ Important Note
Before running the app, ensure you have add .env file with API keys. Like this API_KEY={YOUR-API-KEY}. To get api keys, you can create a new account on [TaskMasterAPI](https://developer.ticketmaster.com/products-and-docs/apis/discovery-api/v2/)

## 🏗 Architectural Overview
This project follows the **MVVM (Model-View-ViewModel) architecture** using **Riverpod for state management**.

- **Model Layer:** Handles data structures and API communication.
- **ViewModel Layer:** Manages business logic and communicates between UI and Model.
- **View Layer:** UI components using Flutter widgets.
- **Data Layer:** Uses **Dio** for API calls and **Hive/SharedPreferences** for local caching.
- **Navigation:** Managed with **GoRouter** for declarative routing.

## ✅ Testing Instructions


## 📜 License
No License available

## 🤝 Contributing
Create a new branch, make changes, and submit a pull request.

---

