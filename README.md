# Weather App

This is a simple weather app built with Flutter that displays current weather information for a given city.

## Features

- Search for a city's weather
- Display weather details including temperature, condition, humidity, and wind speed
- Refresh weather data
- Save the last searched city

## How to Run

1. **Clone the Repository**

   Start by cloning the repository to your local machine.

    ```shell
    git clone https://github.com/shahnawazdev/weather_app.git
    cd weather_app
    ```

2. **Install Dependencies**

   Before running the app, you need to fetch all the dependencies specified in the `pubspec.yaml` file. Run the following command:

    ```shell
    flutter pub get
    ```

3. **Pass the API Key**

   - The application requires an API key from [OpenWeatherMap](https://openweathermap.org/api) to fetch weather data.
   - You must pass this API key as a compile-time constant using the --dart-define flag. Replace YOUR_API_KEY_HERE with your actual API key.

   For running the app in debug mode:
    ```shell
    flutter run --dart-define=API_KEY=YOUR_API_KEY_HERE
    ```

   For building the app for Android:
    ```shell
    flutter build apk --dart-define=API_KEY=YOUR_API_KEY_HERE
    ```
   Or, for iOS (requires macOS):
    ```shell
    flutter build ios --dart-define=API_KEY=YOUR_API_KEY_HERE
    ```
   For Windows:
    ```shell
    flutter build windows --dart-define=API_KEY=YOUR_API_KEY_HERE
    ```
   For macOS (requires macOS):
    ```shell
    flutter build macos --dart-define=API_KEY=YOUR_API_KEY_HERE
    ```