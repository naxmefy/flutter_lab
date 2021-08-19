import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  ApiConstants._();

  static const String BASE_URL = "https://api.themoviedb.org/3/";
  static const String BASE_IMAGE_URL = "https://image.tmdb.org/t/p/w500/";
  static String apiKey = dotenv.get('API_KEY');
}