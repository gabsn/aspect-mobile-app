import 'package:aspect_mobile_app/model/data/nft_metadata.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
//import 'package:dart_mirrors/dart_mirrors.dart';
//import 'dart:mirrors';

void main() {
  late NFTMetadata nftMetadata;
  setUp(
    () {
      nftMetadata = NFTMetadata(
          nftName: lorem(paragraphs: 1, words: 2),
          nftDescription: lorem(paragraphs: 1, words: 10),
          nftImageURL: 'https://4arge.com/',
          nftOwnerAccountAddress:
              '0x00665efb869eba6482fec5acbe1c1b28ec6c6b47297b52038b22daffa3280768',
          nftCollectionName: lorem(paragraphs: 1, words: 1));
    },
  );

  test(
    'NFTMetadata data model has not changed',
    () {
      expect(nftMetadata.nftName, isA<String>());
      expect(nftMetadata.nftDescription, isA<String>());
      expect(nftMetadata.nftImageURL, isA<String>());
      expect(nftMetadata.nftOwnerAccountAddress, isA<String>());
      expect(nftMetadata.nftCollectionName, isA<String>());
    },
  );

/*  test(
    'MyClass interface has not changed',
    () {
      // Get the mirror of the MyClass class
      final myClassMirror = reflectClass(MyClass);

      // Get the declarations of the class's properties and methods
      final declarations = myClassMirror.declarations;

      // Validate that the class has the expected properties and methods
      expect(declarations, contains('someProperty'));
      expect(declarations, contains('someMethod'));

      // Validate that the class does not have any unexpected properties or methods
      expect(declarations, isNot(contains('someUnexpectedProperty')));
      expect(declarations, isNot(contains('someUnexpectedMethod')));
    },
  );*/
}
