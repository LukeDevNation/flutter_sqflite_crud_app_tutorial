# Flutter SQLite CRUD App

## **Description**

This project is a CRUD (Create, Read, Update, Delete) application built with **Flutter** and **SQLite**. It demonstrates how to integrate a local database solution into a Flutter application while adhering to the **MVVM (Model-View-ViewModel)** architecture for clean and maintainable code.

The application is configured to run on both **mobile devices** and **desktop** platforms, and has been tested on **Windows 10**.

## **Technologies Used**

- **Flutter**: A UI toolkit from Google for building natively compiled apps for mobile, web, and desktop from a single codebase.
- **SQLite**: A lightweight relational database for local data storage.
- **Dart**: The programming language used for Flutter development.
- **SQL**: Used to manage and manipulate data in SQLite.
- **MVVM Architecture**: A structured design pattern separating application logic:
  - **Model**: Manages data and database operations.
  - **ViewModel**: Acts as a bridge between the Model and View, handling business logic and preparing data for the UI.
  - **View**: The UI layer responsible for displaying data and interacting with the user.

## **Features**

- **Add Data**: Create new entries with fields such as name, age, and phone number.
- **View Data**: Display saved entries in a list format.
- **Edit Data**: Update existing entries with new information.
- **Delete Data**: Remove entries from the SQLite database.
- **Persistent Storage**: Data remains stored locally even when the app is closed or restarted.
- **Reusable Widgets**: Modular components for better scalability and code reusability.

## **Architecture**

The app is designed using the **MVVM** architecture pattern for better separation of concerns:

- **Model**: Represents and manages data. Interacts with SQLite for CRUD operations.
- **ViewModel**: Processes and prepares data for the View. Bridges user actions with database logic.
- **View**: Displays the UI and listens for changes in the ViewModel.

## **Installation**

To run this project locally:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/LukeDevNation/flutter_sqlite_crud_app_tutorial.git
   ```
