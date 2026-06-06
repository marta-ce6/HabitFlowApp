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

## Habir tracking functionality
Once inside the application, users can create habits by simply entering a name and pressing the '+' symbol. Each habit is stored in Firebase Firestore and is associated with the authenticated user.

Habits can be marked as completed, which allows users to track their daily progress. In addition, users can mark certain habits as important or favorites, comming up in the list, helping them prioritize their goals.

To improve usability, habits can also be deleted when they are no longer relevant and a search feature allows users to quickly filter through their list.
 
