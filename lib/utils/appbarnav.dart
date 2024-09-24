import 'package:berita/models/weather_model/weather_models.dart';
import 'package:berita/services/weather_services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shimmer/shimmer.dart';

class Appbarnav extends StatefulWidget {
  const Appbarnav({super.key});

  @override
  AppbarnavState createState() => AppbarnavState();
}

class AppbarnavState extends State<Appbarnav> {
  WeatherData? _weatherData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchWeather(); // Pastikan ini memang digunakan
  }

  Future<void> _fetchWeather() async {
    try {
      // Request location permissions
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        if (mounted) {
          setState(() {
            _weatherData = null; // Ensure no weather data is set
            _isLoading = false;
          });
        }
        return;
      }

      // Fetch the current position of the device
      Position position = await Geolocator.getCurrentPosition(
          locationSettings:
              const LocationSettings(accuracy: LocationAccuracy.high));

      // Fetch weather data using the location
      WeatherService weatherService = WeatherService();
      WeatherData? weatherData = await weatherService.fetchWeather(
          position.latitude, position.longitude);

      if (mounted) {
        // Check if widget is still mounted
        setState(() {
          _weatherData = weatherData;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _weatherData = null; // Ensure no weather data is set
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _isLoading
            ? Shimmer.fromColors(
                baseColor: Theme.of(context).colorScheme.surface,
                highlightColor: Theme.of(context).colorScheme.primaryContainer,
                child: Container(
                  width: 100,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            : _weatherData != null
                ? Text(
                    "${_weatherData!.name}, ${_weatherData!.weather[0].main}", // Display city and weather
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.5,
                    ),
                  )
                : const Text(
                    "GPS not detected",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.5,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                  ),
        _isLoading
            ? Shimmer.fromColors(
                baseColor: Theme.of(context).colorScheme.surface,
                highlightColor: Theme.of(context).colorScheme.primaryContainer,
                child: Container(
                  width: 50,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            : _weatherData != null
                ? Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            "${_weatherData!.temperature.current.toStringAsFixed(0)}°C", // Display temperature
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(
                    padding: const EdgeInsets.all(10),
                    child: const Center(
                      child: Text(
                        "°C",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ), // Display default temperature when no data
      ],
    );
  }
}
