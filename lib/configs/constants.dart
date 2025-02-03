import 'package:clima/views/views.dart';
import 'package:get/get.dart';

// HEIGHT
height(double height) => SizedBox(height: height);

// WIDTH
width(double width) => SizedBox(width: width);

// TOAST

toast(String title, String message) => Get.snackbar(title, message,
    backgroundColor: Colors.indigo, colorText: AppColors.textColor);
