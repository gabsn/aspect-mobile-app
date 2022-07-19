/// --------------------------------------------------
/// service_locator.dart
///
/// -> central services locator using get_it package
/// -> register all central services here as Singleton
/// --------------------------------------------------

/// Imports ------------------------------------------
/// External
import 'package:get_it/get_it.dart';

///Services
import 'package:aspect_mobile_app/model/services/camera_service/camera_service.dart';
import 'package:aspect_mobile_app/model/services/aspect_api_services/aspect_api_services.dart';

/// Imports ------------------------------------------

final getIt = GetIt.instance;

void setupGetIt() {
  try {
    //Camera Service
    getIt.registerLazySingleton<CameraService>(() => CameraService());

    //Aspect API Service
    getIt.registerLazySingleton<AspectAPIService>(() => AspectAPIService());
  } catch (e) {
    throw Exception(e.toString());
  }
}
