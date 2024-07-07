import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherProvider with ChangeNotifier {
  Weather? _weatherData; // Holds the current weather data
  bool _isLoading = false; // Tracks loading state
  String? _errorMessage; // Stores error message if fetch fails
  List<String> _recentSearches = []; // List of recent city searches

  final WeatherService _weatherService =
      WeatherService(); // Weather service instance for API calls

  // Getters for accessing private fields outside the class
  Weather? get weatherData => _weatherData;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<String> get recentSearches => _recentSearches;

  WeatherProvider() {
    _loadRecentSearches(); // Load recent searches on initialization
  }

  // Fetches weather data for a given city and updates the state
  Future<void> fetchWeather(String city) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners(); // Notify listeners to update UI based on loading state

    try {
      final weatherJson =
          await _weatherService.fetchWeather(city); // Fetch weather data
      _weatherData =
          Weather.fromJson(weatherJson); // Parse JSON into Weather object
      _addRecentSearch(city); // Add city to recent searches
    } catch (error) {
      _errorMessage = error.toString(); // Set error message on failure
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners to update UI based on new state
    }
  }

  // Adds a city to the list of recent searches and updates local storage
  Future<void> _addRecentSearch(String city) async {
    if (!_recentSearches.contains(city)) {
      _recentSearches.add(city);
      if (_recentSearches.length > 10) {
        _recentSearches.removeAt(0); // Keep only the latest 10 searches
      }
      final prefs =
          await SharedPreferences.getInstance(); // Access SharedPreferences
      prefs.setStringList('recent_searches',
          _recentSearches); // Update recent searches in local storage
      notifyListeners(); // Notify listeners to update UI
    }
  }

  // Loads the list of recent searches from local storage
  Future<void> _loadRecentSearches() async {
    final prefs =
        await SharedPreferences.getInstance(); // Access SharedPreferences
    _recentSearches = prefs.getStringList('recent_searches') ??
        []; // Load recent searches or default to empty list
    notifyListeners(); // Notify listeners to update UI
  }
}
