import 'dart:convert';
import 'package:http/http.dart' as http;

class GoogleDirectionsService {
  final String apiKey = 'AIzaSyBRB7ed2WHE1OQtq8HzHWd1syZjQSHwx1c';

  Future<Map<String, dynamic>> getDirections(double originLat, double originLng, double destLat, double destLng) async {
    final String url = 'https://maps.googleapis.com/maps/api/directions/json?origin=$originLat,$originLng&destination=$destLat,$destLng&key=$apiKey';

    final http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Parse the JSON data
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load directions');
    }
  }
}
