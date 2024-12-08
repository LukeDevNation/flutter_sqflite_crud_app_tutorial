# Flutter SQLite CRUD App

**Description:**

This project is a task management application (To-Do List) created with **Flutter** and using **SQLite** as a local database to handle CRUD operations (Create, Read, Update, Delete). This tutorial aims to teach you how to integrate **SQLite** into a **Flutter** app and perform basic data manipulation operations in a local database.

## Technologies Used

- **Flutter**: A UI framework from Google to build native apps for iOS, Android, web, and more.
- **SQLite**: A lightweight database for local storage on mobile devices.
- **Dart**: The programming language used in Flutter.
- **Provider**: A state management solution for Flutter that allows you to manage and share app data across the widget tree.
- **MVVM Architecture**: A design pattern used to separate the concerns of the application. It stands for Model-View-ViewModel, where:
  - **Model**: Represents the data and business logic.
  - **View**: The UI layer responsible for displaying the data.
  - **ViewModel**: Acts as a bridge between the Model and the View, handling data manipulation and preparing it for the UI.

## Features

- **Create tasks**: Allows adding new tasks with a title, description, and due date.
- **Read tasks**: Displays a list of tasks saved in the local database.
- **Update tasks**: Allows editing existing tasks.
- **Delete tasks**: Allows deleting tasks from the database.
- **Data persistence**: Data is stored locally in an SQLite database, even when the app is closed.

## Architecture

This application is structured using the **MVVM** architecture pattern for better separation of concerns and code maintainability:

- **Model**: Represents the task data and interactions with the SQLite database.
- **ViewModel**: Handles business logic and acts as an intermediary between the Model and View. It manages task-related operations such as adding, editing, or deleting tasks.
- **View**: The UI layer that displays tasks to the user and listens for changes in the ViewModel.

The **Provider** package is used for state management. It provides an efficient way to update the UI in response to changes in the ViewModel, ensuring that the UI is automatically updated when tasks are added, modified, or deleted.

## Installation

To run this project locally, follow these steps:

1. **Clone the repository**:
   ```bash
   https://github.com/Ingeniebrio1500/flutter_sqlite_crud_app_tutorial.git
