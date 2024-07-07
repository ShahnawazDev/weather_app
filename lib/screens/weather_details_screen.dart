import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/utils.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/widgets/weather_info_card.dart';

class WeatherDetailsScreen extends StatelessWidget {
  const WeatherDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    final weatherData = weatherProvider.weatherData!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(weatherData.cityName,
                  style: const TextStyle(fontSize: 48)),
              Row(
                children: [
                  Expanded(
                    child: Image.network(
                      'https://openweathermap.org/img/wn/${weatherData.icon}@2x.png',
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(weatherData.description.capitalizeWords(),
                            style: const TextStyle(fontSize: 24)),
                        Text('${weatherData.temperature}°C',
                            style: const TextStyle(fontSize: 48)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              DateFormat('EEEE').format(DateTime.now()),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 4),
                            Text(DateFormat('MMMM dd, yyyy')
                                .format(DateTime.now())),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              WeatherInfoCard(weatherData: weatherData),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () async {
                  await weatherProvider
                      .fetchWeather(weatherProvider.weatherData!.cityName);
                },
                child: const Text('Refresh'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
