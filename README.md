# ny_times

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# ProjectName ReadMe

The NY Times News App is a Flutter-based application designed to fetch and display the latest news
articles using the NY Times API.
This app provides users with up-to-date news content in an organized and user-friendly interface,
ensuring a seamless reading experience.

## Table of Contents

- [Features](#features)
- Fetch Latest News: Retrieve news articles from the NY Times API and display them in a clean,
  categorized layout.

- [Installation](#installation)
- Flutter SDK(Android SDK version 34.0.0)
- Android Studio
- An Android device
- A valid API key for the NY Times API(https://developer.nytimes.com/get-started)
  Clone the Repository
- git clone https://github.com/your-username/ny-times-news-app.git
- cd ny-times-news-app
- NY_TIMES_API_KEY=your-ny-times-api-key
- flutter pub get
- flutter run


- [Prerequisites](#prerequisites)
- Flutter SDK:
  Install the Flutter SDK from the official Flutter Installation Guide.
  Make sure to set up the environment variables for Flutter.

- Development Tools:
  Install Android Studio or Visual Studio Code for Flutter development.
  Ensure that you have installed Flutter and Dart plugins in your IDE.

- Device or Emulator:
  Have a physical Android/iOS device connected to your system or set up an emulator (via Android
  Studio or Xcode).

- NY Times API Key:
  Sign up for a free account on the NY Times Developer Portal.
  Create an app and generate an API key for accessing the NY Times API.

- Git:
  Ensure you have Git installed to clone the repository. You can download Git from here.

- [Clone the Repository](#clone-the-repository)
- Open your terminal or command prompt.
- Use the following command to clone the NY Times News App repository:
  git clone https://github.com/your-username/ny-times-news-app.git

- Navigate to the cloned repository directory by running:
  cd ny-times-news-app


- [Configuration](#configuration)
- Navigate to the Project Directory:
  cd ny-times-news-app
- Set Up the NY Times API Key:
  NY_TIMES_API_KEY=your-ny-times-api-key
    - Run the following command to install all the required packages:
      {` packages are :
      cupertino_icons: ^1.0.6
      dartz: ^0.10.1
      flutter_bloc: ^8.1.6
      get_it: ^7.7.0
      dio: ^5.6.0
      flutter_screenutil: ^5.9.1`}
      flutter pub get
- Configure the Emulator or Device:
  If you’re using an emulator, make sure it’s set up and running (e.g., using Android Studio).
  If you’re using a physical device, ensure USB debugging is enabled, and your device is properly
  connected.
- Verify Configuration by run this command:
  flutter doctor
  ! Resolve any issues flagged by flutter doctor.


- [Build and Run](#build-and-run)
- Open a Terminal:
  cd ny-times-news-app
- Start the App:
  To build and run the app, use this command: flutter run
- Test the App:
  If you’re using an emulator, ensure it’s running.
  If using a physical device, connect it via USB.

- Hot Reload/Restart:
  Press r for Hot Reload to see UI changes instantly.
  Press R for Hot Restart if deeper changes are needed.

- [Usage](#usage)

Follow these steps to use the NY Times News App after it is installed and running:
1. HomeScreen:
When you open the app, you’ll see the latest news fetched from the NY Times API.
Scroll through the list to explore the available articles.
 
2. Article Details
   Title: The full headline of the article.
   Author: The author of the article.
   Published Date: The date the article was published.
   Article Summary: A brief summary of the article’s content.
   Full Text/Content: More in-depth content from the article.

- [Contributing](#contributing)

We welcome contributions to the NY Times News App! If you'd like to contribute, whether by fixing bugs, adding features, or improving documentation, please follow these steps:

- Fork the Repository
  Visit the repository page and click on Fork to create your own copy of the repository.

- Create a New Branch
  It’s a good practice to create a new branch for your changes.
  Use a descriptive name for your branch, such as fix-article-detail-ui or add-search-feature.
* git checkout -b new-feature

- Make Your Changes
Work on your changes locally. Ensure that you follow the existing code style and best practices.
Add tests or documentation if applicable.

- Commit Your Changes
  Commit your changes with descriptive messages. Be clear about what your commit does.
* git commit -m "Add search functionality to home screen"

- Push Your Changes
  Push your branch to your fork on GitHub.
* git push origin new-feature

- Create a Pull Request (PR)
  Go to the original repository and create a Pull Request (PR) from your fork.
  Provide a description of what your changes do and why they are useful.


- Stay Updated
Regularly sync your fork with the main repository to avoid conflicts:
* git remote add upstream https://github.com/your-username/NY-Times-News-App.git
* git fetch upstream
* git merge upstream/main

- [License](#license)
  The NY Times News App is licensed under the MIT License. You can freely use, modify, and distribute this project, provided that you include the original copyright notice and disclaimers.
