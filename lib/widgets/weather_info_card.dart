import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/info_tile.dart';

class WeatherInfoCard extends StatelessWidget {
  const WeatherInfoCard({
    super.key,
    required this.weatherData,
  });

  final Weather weatherData;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white12,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.white,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(64.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InfoTile(
                icon: Icons.water,
                title: '${weatherData.humidity}%',
                subtitle: 'Humidity',
              ),
              InfoTile(
                icon: Icons.wind_power,
                title: '${weatherData.windSpeed}m/s',
                subtitle: 'Wind Speed',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
