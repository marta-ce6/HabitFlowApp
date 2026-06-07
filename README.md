# HabitFlow

Track your habits.

## Description
HabitFlow is a mobile application developed using Flutter and Firebase that aims to help users to track their habits and build constancy. With a simple, intuitive and visually clear interface, HabitFlow allow users to focus on personal progress without complexity. The app combines authentication, real-time data storage and interactive interface to make the best of the user experience.


## Purpose of the app
The motivation for this project comes from the common difficulty people face when trying to buld new habits or maintain routines over time. HabitFlow addresses this by allowing users to track their daily actions in a structured way and visualize their progress over time.
Each user has their own private space where they can create, manage, and update their habits. The application emphasizes simplicity: instead of overwhelming the user with features, it focuses on clarity and ease of use.

## Authentification and User Management
The application uses Firebase Authentication to handle user registration and login. Each user account is securely managed, and once authenticated, the user gains access only to their own data.

This ensures data separation between users and provides a personalized experience. Logging out clears the session and returns the user to the initial screen.

## Habit tracking functionality
Once inside the application, users can create habits by simply entering a name and pressing the '+' symbol. Each habit is stored in Firebase Firestore and is associated with the authenticated user.

Habits can be marked as completed, which allows users to track their daily progress. In addition, users can mark certain habits as important or favorites, comming up in the list, helping them prioritize their goals.

To improve usability, habits can also be deleted when they are no longer relevant and a search feature allows users to quickly filter through their list.
 
## Progress and statictits
To give users a clearer understanding of their activity, the application includes a statistics screen. This screen summarizes the user’s progress by showing total habits, completed habits, pending habits and favorite habits.
A visual progress indicator is also included to provide immediate feedback on completion rates. This helps reinforce motivation by making progress more visible and measurable.

## Architecture and technical design
- Layers and interface
The project follows a simple layered architecture to ensure maintainability and separation of concepts. The user interface layer is responsible for displying screens and handling user interactions. This includes screens such as login, registration, home, habits and statistics.
The service layer contains the core business logic and handles all communication with Firebase. Authentication logic is separated into an AuthService, while all habit-related operations (create, update, delete and search) are handled by a HabitService.
Firebase acts as the backend for both authentication and real-time database storage using Cloud Firestore. This allows changes to be reflected instantly across the application without manual refresh.
The interface was designed with simplicity and usability in mind. The goal was to ensure that any user can understand and interact with the application without instructions. Several UX improvements were included throughout the development process, such as loading indicators during asynchronous operations, empty states when no data is available and tooltips on interactive elements to improve clarity. The layout is intentionally minimal to avoid distractions and to keep the focus on habit tracking

- Data handling and privacy
Since the application stores user-related data, basic privacy considerations were taken into account. Each user’s data is stored separately in Firestore under their unique identifier, ensuring that no user can access another user’s information. No sensitive personal data beyond authentication credentials is stored. The use of Firebase also ensures that data transmission is handled securely.

- Technology used
This project was developed using Flutter for cross-platform mobile development and Firebase for backend services. The main technologies include Firebase Authentication for user management and Cloud Firestore for real-time data storage. Material Design components were used to maintain a consistent and modern interface.

## Running the app
To run the project locally, the repository must first be cloned and dependencies installed using Flutter’s package manager. Firebase must also be configured using the FlutterFire CLI before execution. Once setup is complete, the application can be launched on an emulator or physical device using Flutter’s standard run command. 

With the app running, the first screen visible is the home page where you can choose whether to log in or register. Each of those options has its own screen to develop the task by introducing an email and a password. Both must follow a specific format. The email address must include the @ symbol, and the password must contain at least 6 characters. Once identity has been verified, you will be taken to the home screen where you will see the email address used to log in and two buttons: Go to habits and View Stats. Pressing 'Go to habits', you access to a screen where you can add new habits, search for habits, delete them, put them into favourite or important and check them as completed. Otherwise, if 'View Stats' is pressed, a screen showing the number of total habits, completed habits, pending habits and favorite habits appears.
It is possible to log out from the home screen pressing the button in the upper right corner.


## Future improvements
Although the current version of HabitFlow is fully functional, there are several possible enhancements that could be implemented in the future. These include habit streak tracking, notifications or reminders, calendar-based visualization and more advanced analytics using charts.