import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  // Retrieves the API key from environment variables for added security
  final String apiKey = const String.fromEnvironment("API_KEY");

  // Asynchronously fetches weather data for a specified city using the OpenWeatherMap API
  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));

    print("API called: ");
    print(" STATUS CODE: ${response.statusCode}");

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
