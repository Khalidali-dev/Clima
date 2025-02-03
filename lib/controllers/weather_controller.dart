import 'dart:developer';
import 'package:clima/views/views.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class WeatherController extends GetxController implements GetxService {
  CurrentWeatherService weatherService = CurrentWeatherService();

  final weatherModel = Rx<WeatherModel?>(null);

  FlutterLocalNotificationsPlugin plugin = FlutterLocalNotificationsPlugin();

  final loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getCurrentCity();
    _initNotifications();
  }

  _initNotifications() async {
    final androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final iosSettings = DarwinInitializationSettings();
    final initializationSettings =
        InitializationSettings(android: androidSettings, iOS: iosSettings);
    plugin.initialize(initializationSettings);
  }

  showNotifications(String temp) async {
    final androidDetails = AndroidNotificationDetails(
        'clima_weather', 'Temperature exceeded',
        importance: Importance.high, priority: Priority.high);

    final iosDetails = DarwinNotificationDetails();
    final notificationDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);

    plugin.show(0, "Temperature Exceeded", "Temperature exceeded than $temp°",
        notificationDetails);
  }

  // GET CURRENT CITY NAME
  Future<void> getCurrentCity() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return toast("Permission", "Location services are disabled.");
    }

    // Request location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return toast("Permission", "Location permission denied.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return toast(
          "Permission", "Location permissions are permanently denied.");
    }

    // Get the current location
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      loading.value = true;
      weatherModel.value = await weatherService
          .getWeather(placemarks.first.subAdministrativeArea.toString());

      loading.value = false;
    } catch (e) {
      loading.value = false;
      log("Error  $e");
    }
    return;
  }
}
