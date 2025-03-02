# WeatherMate Documentation

## Overview
WeatherMate is a Flutter-based weather application that provides real-time weather information based on the user's current location or a custom search query. The app is designed to be responsive and works seamlessly across mobile, tablet, and desktop platforms. It uses the **Clean Architecture** pattern to ensure modularity, testability, and maintainability. The app integrates with Firebase for authentication and uses the **weatherapi.com** API to fetch weather data.

---

## Features
1. **Authentication**:
   - Login with email and password.
   - Register with email, password, and username.
   - Social login (Google, Facebook, GitHub, LinkedIn).

2. **Weather Information**:
   - Current weather conditions (temperature, humidity, wind speed, UV index, etc.).
   - Hourly weather forecast for the next 24 hours.
   - 7-day weather forecast.
   - Air conditions (real feel, wind, humidity, UV index).

3. **Responsive Design**:
   - Adapts to different screen sizes (mobile, tablet, desktop).

4. **Error Handling**:
   - Graceful handling of network errors, invalid inputs, and other exceptions.

5. **Location Services**:
   - Fetches the user's current location to provide localized weather data.

---

## Architecture
The app follows the **Clean Architecture** pattern, which separates the code into three main layers:

1. **Presentation Layer**: Handles UI and user interactions.
2. **Domain Layer**: Contains business logic and use cases.
3. **Data Layer**: Manages data sources and repositories.

---

## Project Structure
The project is organized as follows:

```
lib/
├── core/
│   ├── error/
│   ├── helpers/
│   ├── utils/
│   └── widgets/
├── features/
│   ├── auth/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   └── home/
│       ├── data/
│       ├── domain/
│       └── presentation/
└── main.dart
```

---

## Core Layer
The **Core Layer** contains shared utilities, error handling, and API services.

### Key Components:
1. **`ApiService`**:
   - Handles HTTP requests to the weather API.
   - Uses `Dio` for network requests.

2. **`LocationService`**:
   - Fetches the user's current location using the `geolocator` package.

3. **Error Handling**:
   - `Failure` class for representing errors.
   - `ErrorHandler` for handling different types of exceptions (e.g., Firebase, network, platform).

4. **Dependency Injection**:
   - Uses `GetIt` for dependency injection.
   - `setupServiceLocator` registers dependencies like `ApiService`, `WeatherRepository`, and `LocationService`.

---

## Data Layer
The **Data Layer** manages data sources and repositories.

### Key Components:
1. **`WeatherRemoteDataSource`**:
   - Fetches weather data from the API.
   - Uses `ApiService` to make network requests.

2. **`WeatherRepositoryImpl`**:
   - Implements the `WeatherRepository` interface.
   - Handles errors and returns `Either<Failure, WeatherEntity>`.

3. **`FirebaseAuthDataSource`**:
   - Handles Firebase authentication (login, registration, sign-out).

---

## Domain Layer
The **Domain Layer** contains business logic and use cases.

### Key Components:
1. **`GetWeatherUsecase`**:
   - Executes the `getWeather` use case.
   - Uses `WeatherRepository` to fetch weather data.

2. **`LoginWithEmailAndPasswordUseCase`**:
   - Handles the login operation.

3. **`RegisterWithEmailAndPasswordUseCase`**:
   - Handles the registration operation.

---

## Presentation Layer
The **Presentation Layer** handles UI and state management.

### Key Components:
1. **`WeatherCubit`**:
   - Manages the state of weather data.
   - Emits `WeatherLoading`, `WeatherSuccess`, and `WeatherFailed` states.

2. **`LocationCubit`**:
   - Manages the state of the user's location.
   - Emits `LocationLoading`, `LocationSuccess`, and `LocationFailed` states.

3. **`AuthCubit`**:
   - Manages authentication state (login, registration, sign-out).

4. **Responsive UI**:
   - Uses `DevicePreview` for testing different screen sizes.
   - Adaptive layouts for mobile, tablet, and desktop.

---

## Flow of the App
1. **Authentication**:
   - User logs in or registers using email/password or social login.
   - On successful authentication, the user is redirected to the home screen.

2. **Fetch Location**:
   - The `LocationCubit` fetches the user's current location using `LocationService`.

3. **Fetch Weather**:
   - The `WeatherCubit` uses `GetWeatherUsecase` to fetch weather data based on the location.

4. **Display Weather**:
   - The UI listens to the `WeatherCubit` state and displays the weather data or error messages.

---

## Error Handling
- The app uses `Either<Failure, WeatherEntity>` to handle errors gracefully.
- Errors are categorized into `ServerFailure` and other generic failures.

---

## Testing
- The app includes unit tests for use cases, repositories, and data sources.
- Mockito is used for mocking dependencies in tests.

---

## Conclusion
WeatherMate is a robust and scalable weather application built using Flutter and Clean Architecture. It provides a seamless user experience across different devices and handles errors gracefully. The modular design ensures that the app is easy to maintain and extend in the future.

---

## Video Links
- **Authentication Feature**: [Watch Video](https://drive.google.com/file/d/1L9RZSW_2nX4V0WlSUpO_sT567NX5eCW0/view?usp=sharing)
- **Weather Feature**: [Watch Video](https://drive.google.com/file/d/1zXyzqWkMmmyHHHVvC5QbRnPPIXHXI8B1/view?usp=sharing)

---

## Future Enhancements
1. **Push Notifications**: Notify users about severe weather conditions.
2. **Dark Mode**: Add support for dark mode.
3. **Multi-language Support**: Add support for multiple languages.
4. **Offline Mode**: Cache weather data for offline access.

---

## Getting Started
1. Clone the repository.
2. Run `flutter pub get` to install dependencies.
3. Set up Firebase and add your `google-services.json` file.
4. Run the app using `flutter run`.

---

## Dependencies
- **FlutterFire**: For Firebase integration.
- **Dio**: For network requests.
- **Geolocator**: For fetching the user's location.
- **GetIt**: For dependency injection.
- **Bloc**: For state management.
- **DevicePreview**: For testing responsive layouts.

---

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---


Thank you for using WeatherMate! 🌦️
