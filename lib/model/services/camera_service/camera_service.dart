/// --------------------------------------------------
/// camera_services.dart
/// -> Classes to initialise and use device camera
/// --------------------------------------------------

/// Imports ------------------------------------------
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

/// Model

/// Imports ------------------------------------------

class CameraService {
  late CameraDescription _firstCamera;
  get getCamera => _firstCamera;

  Future<void> initializeCamera() async {
    // Ensure that plugin services are initialized so that `availableCameras()`
    // can be called before `runApp()`
    WidgetsFlutterBinding.ensureInitialized();

    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    _firstCamera = cameras.first;
  }
}
