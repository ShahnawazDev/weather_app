import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/weather_details_screen.dart';
import 'package:weather_app/widgets/city_search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    void loadWeatherDetailsScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WeatherDetailsScreen()),
      );
    }

    void loadWeatherDetails(String city) async {
      await weatherProvider.fetchWeather(city);
      if (weatherProvider.errorMessage == null) {
        loadWeatherDetailsScreen();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
      ),
      body: weatherProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CitySearchBar(onSearch: (city) => loadWeatherDetails(city)),
                  const SizedBox(height: 16.0),
                  const Text('Recent Searches', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 16.0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: weatherProvider.recentSearches.length,
                      itemBuilder: (context, index) {
                        final city = weatherProvider.recentSearches[index];
                        return Card(
                          color: Colors.white12,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ListTile(
                            title: Text(city),
                            onTap: () => loadWeatherDetails(city),
                          ),
                        );
                      },
                    ),
                  ),
                  if (weatherProvider.errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        weatherProvider.errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
            ),
    );
  }
}
