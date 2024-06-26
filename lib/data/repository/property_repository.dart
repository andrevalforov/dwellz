import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:realtor_app/core/network/dio_exceptions.dart';
import 'package:realtor_app/data/api/property_api.dart';
import 'package:realtor_app/data/models/property_model.dart';

class PropertyRepository {
  final PropertyApi _propertyApi;

  PropertyRepository(this._propertyApi);

  // create announcement models from api data
  Future<List<PropertyModel>> getProperties() async {
    try {
      final res = await _propertyApi.fetchProperties();
      List<PropertyModel> propertyList = [];
      List<dynamic> hits = res['hits'];
      for (var hit in hits) {
        PropertyModel property = PropertyModel(
          externalID: hit['externalID'],
          coverPhoto: hit['coverPhoto']['url'],
          title: hit['title'],
          rentFrequency: hit['rentFrequency'],
          location: hit['location'][0]['name'],
          category: hit['category'][0]['name'],
          amenities: hit['amenities'],
          productScore: hit['productScore'],
          type: hit['type'],
          rooms: hit['rooms'],
          baths: hit['baths'],
          price: hit['price']
        );
        propertyList.add(property);
      }
      // print(propertyList);
      return propertyList;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }
}
