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
  Future<List> getAspectAssets({required int limit}) async {
    List retList = [];

    try {
      var response = await http.get(
        Uri.parse(
            'https://api-testnet.aspect.co/api/v0/assets?sort_by=minted_at&order_by=desc&limit=$limit'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      //https://api-testnet.aspect.co/api/v0/assets?contract_address=0x07b6d00f28db723199bb54ca74a879a5102c44141f0e93674b2cb25f8f253c62%27&order_by=desc&limit=10
      //https://api-testnet.aspect.co/api/v0/assets?contract_address=0x07b6d00f28db723199bb54ca74a879a5102c44141f0e93674b2cb25f8f253c62%27&order_by=asc&sort_by=minted_at&limit=10
      //'https://api-testnet.aspect.co/api/v0/assets?sort_by=minted_at&order_by=desc&limit=$limit'

      retList = json.decode("[${response.body}]");

      return retList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List> getAspectAssetsByWalletAddress(
      {required int limit, required String walletAddress}) async {
    List retList = [];

    try {
      var response = await http.get(
        Uri.parse(
            'https://api-testnet.aspect.co/api/v0/assets?owner_address=$walletAddress&sort_by=minted_at&order_by=desc&limit=$limit'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      retList = json.decode("[${response.body}]");

      return retList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
