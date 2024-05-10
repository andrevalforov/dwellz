import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realtor_app/core/shared_provider/shared_providers.dart';
import 'package:realtor_app/data/api/property_api.dart';
import 'package:realtor_app/data/models/property_model.dart';
import 'package:realtor_app/data/providers/property_state_notifier.dart';
import 'package:realtor_app/data/repository/property_repository.dart';

// get api of the properties
final propertyApiProvider = Provider((ref) {
  return PropertyApi(ref.read(dioClientProvider));
});

//get PropertyRepository
final propertyRepositoryProvider = Provider((ref) {
  return PropertyRepository(ref.read(propertyApiProvider));
});

final propertyProvider =
    StateNotifierProvider<PropertiesNotifier, List<PropertyModel>>((ref) {
  return PropertiesNotifier(ref: ref);
});

//check loading status
final isLoadingPropertiesProvider = StateProvider<bool>((ref) {
  return true;
});
