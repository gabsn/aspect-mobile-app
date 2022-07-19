/// --------------------------------------------------
/// aspect_api_services.dart
///
/// -> All business logic to call aspect API
/// --------------------------------------------------

/// Imports ------------------------------------------
import 'dart:convert';
import 'package:http/http.dart' as http;

/// Imports ------------------------------------------

class AspectAPIService {
  Future<String> getAspectAssets({required int limit}) async {
    try {
      var response = await http.get(
        Uri.parse(
            'https://api-testnet.aspect.co/api/v0/assets?sort_by=minted_at&order_by=desc&limit=3'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      return response.body;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
