# Location-Based Flutter App

A simple Flutter application that allows users to input a location and display it on a Google Map. This app demonstrates basic user input handling, Google Maps integration, and state management.

## Features

- User can input a location (city name, address, or coordinates).
- Displays the entered location on a Google Map with a marker.
- Basic validation for user input.
- Error handling for invalid or non-existent locations.

## Requirements

- Flutter SDK
- Dart SDK
- An API key for Google Maps

## Getting Started

### Prerequisites

Make sure you have Flutter and Dart installed on your machine. You can follow the installation guide on the official [Flutter website](https://flutter.dev/docs/get-started/install).

### API Key Setup

1. **Create a Google Cloud Project**:
    - Go to the [Google Cloud Console](https://console.cloud.google.com/).
    - Create a new project.

2. **Enable APIs**:
    - Enable the **Maps SDK for Android** and **Maps SDK for iOS**.

3. **Create API Key**:
    - Navigate to **APIs & Services > Credentials**.
    - Create a new API key and restrict it as necessary.

4. **Add API Key to the Project**:
    - For Android, add your API key in `android/app/src/main/AndroidManifest.xml`:
      ```xml
      <meta-data
          android:name="com.google.android.geo.API_KEY"
          android:value="YOUR_API_KEY_HERE" />
      ```

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/location-based-flutter-app.git
   cd location-based-flutter-app
