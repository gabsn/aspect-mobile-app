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

/// Imports ------------------------------------------

final getIt = GetIt.instance;

void setupGetIt() {
  try {
    //Logging Service
    getIt.registerLazySingleton<CameraService>(() => CameraService());
  } catch (e) {
    throw Exception(e.toString());
  }
}
