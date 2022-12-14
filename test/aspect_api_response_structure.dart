import 'package:aspect_mobile_app/model/services/aspect_api_services/aspect_api_services.dart';
import 'package:aspect_mobile_app/view_model/screens_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

var nftAssetList = [];

//class MockAspectAPIService extends Mock implements AspectAPIService {}

void main() {
  late AspectAPIService aspectAPIService;
  late List<dynamic> result;
  late List nftAssets;

  setUp(
    () async {
      aspectAPIService = AspectAPIService();
      result = (await aspectAPIService.getAspectAssets(limit: 10));
      nftAssets = result[0]['assets'];
    },
  );

  test(
    'print all Assets',
    () {
      print(result.toString());
    },
  );

  test(
    'response length should be 10',
    () {
      expect(result[0]['assets'].length, 10);
    },
  );

  test(
    'assets / name is a String',
    () {
      //Convert Assets to Data Objects
      for (var element in nftAssets) {
        print(element['name'].toString());
        //Check only those values which are not null
        if (element['name'] != null) {
          expect(element['name'], isA<String>());
        }
      }
    },
  );

  test(
    'assets / owner / account owner is a String',
    () {
      //Convert Assets to Data Objects
      for (var element in nftAssets) {
        print(element['owner']['account_address'].toString());
        //Check only those values which are not null
        if (element['owner']['account_address'] != null) {
          expect(element['owner']['account_address'], isA<String>());
        }
      }
    },
  );
}
