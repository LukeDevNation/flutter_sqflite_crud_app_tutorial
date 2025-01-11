# Flutter SQFLite CRUD App

## **Description**

This project is a CRUD (Create, Read, Update, Delete) application built with **Flutter** and **SQFLite**. It demonstrates how to integrate a local database solution into a Flutter application while adhering to the **MVVM (Model-View-ViewModel)** architecture for clean and maintainable code.

The application is configured to run on both **mobile devices** and **desktop** platforms, and has been tested on **Windows 10**.

## **Technologies Used**

- **Flutter**: A UI toolkit from Google for building natively compiled apps for mobile, web, and desktop from a single codebase.
- **SQFLite**: A lightweight relational database for local data storage in Flutter apps.
- **Dart**: The programming language used for Flutter development.
- **SQL**: Used to manage and manipulate data in SQFLite.
- **MVVM Architecture**: A structured design pattern separating application logic:
  - **Model**: Manages data and database operations using SQFLite.
  - **ViewModel**: Acts as a bridge between the Model and View, handling business logic and preparing data for the UI.
  - **View**: The UI layer responsible for displaying data and interacting with the user.

## **Features**

- **Add Data**: Create new entries with fields such as name, age, and phone number.
- **View Data**: Display saved entries in a list format.
- **Edit Data**: Update existing entries with new information.
- **Delete Data**: Remove entries from the SQFLite database.
- **Persistent Storage**: Data remains stored locally even when the app is closed or restarted.
- **Reusable Widgets**: Modular components for better scalability and code reusability.

## **Architecture**

The app is designed using the **MVVM** architecture pattern for better separation of concerns:

- **Model**: Represents and manages data. Interacts with SQFLite for CRUD operations.
- **ViewModel**: Processes and prepares data for the View. Bridges user actions with database logic.
- **View**: Displays the UI and listens for changes in the ViewModel.

## **Demonstration**

Here are some screenshots of the application in action:

### Home Screen

<div align="center">
  <img src="https://github.com/user-attachments/assets/645cc1ea-0a53-4650-9efa-28fcb994bc0c" alt="home_screen">
</div>

### Delete User

<div align="center">
  <img src="https://github.com/user-attachments/assets/121dc5e4-1d63-4241-ad54-f8930c01bd37" alt="delete_user">
</div>

### List of Users

<div align="center">
  <img src="https://github.com/user-attachments/assets/64787ee2-ae79-4c17-babd-627562d3b792" alt="user_list">
</div>

### Edit User

<div align="center">
  <img src="https://github.com/user-attachments/assets/7848c351-ac6a-48aa-8fa4-f0c2e50f8e3d" alt="edit_user">
</div>

---

## **Installation**

To run this project locally:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/LukeDevNation/flutter_sqflite_crud_app_tutorial.git
