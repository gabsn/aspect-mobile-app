/// --------------------------------------------------
/// camera_screen.dart
///
/// -> Load Device Camera and take a picture
///
/// Imports ------------------------------------------
/// External
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

/// View Model
import 'package:aspect_mobile_app/view_model/screens_view_model.dart';

/// View
import 'package:aspect_mobile_app/view/widgets/material_button.dart';
import 'package:aspect_mobile_app/view/screens/camera/display_image_screen.dart';

///Model
import 'package:aspect_mobile_app/model/constants/constants.dart';

import 'package:aspect_mobile_app/model/services/camera_service/camera_service.dart';
import 'package:aspect_mobile_app/model/services/service_locator.dart';

/// Imports ------------------------------------------

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late CameraDescription camera;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    try {
      super.initState();

      //get camera
      camera = getIt<CameraService>().getCamera;

      // To display the current output from the Camera,
      // create a CameraController.
      _controller = CameraController(
        // Get a specific camera from the list of available cameras.
        camera,
        // Define the resolution to use.
        ResolutionPreset.medium,
      );

      // Next, initialize the controller. This returns a Future.
      _initializeControllerFuture = _controller.initialize();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    try {
      return WillPopScope(
        onWillPop: () async => false,
        child: Consumer<ScreensChangeNotifier>(
          builder: (context, screenChangeNotifier, _) {
            return Container(
              color: Colors.black87,
              child: Container(
                decoration: kAddGameModalBoxDecoration.copyWith(
                    color: kStyleGuideColorGreen),
                padding: const EdgeInsets.only(
                    top: 30.0, left: 30.0, right: 30.0, bottom: 30.0),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 40.0),
                      const Text(
                        'Snap & Mint',
                        style: TextStyle(
                            fontSize: 40,
                            color: kStyleGuideColorDarkGrey,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20.0),
                      FutureBuilder<void>(
                        future: _initializeControllerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            // If the Future is complete, display the preview.
                            return CameraPreview(_controller);
                          } else {
                            // Otherwise, display a loading indicator.
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                      const SizedBox(height: 20.0),
                      MaterialSolidButton(
                        backgroundColor: kStyleGuideColorDarkGrey,
                        buttonText: 'Take Picture & Mint NFT',
                        buttonTextStyle: kLoginButtonTextStyle.copyWith(
                            color: kStyleGuideColorGreen),
                        onPressed: () async {
                          // Take the Picture in a try / catch block. If anything goes wrong,
                          // catch the error.
                          try {
                            // Ensure that the camera is initialized.
                            await _initializeControllerFuture;

                            // Attempt to take a picture and get the file `image`
                            // where it was saved.
                            final image = await _controller.takePicture();

                            print('image: ${image.path}');

                            if (!mounted) return;

                            // If the picture was taken, display it on a new screen.
                            await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DisplayPictureScreen(
                                  // Pass the automatically generated path to
                                  // the DisplayPictureScreen widget.
                                  imagePath: image.path,
                                ),
                              ),
                            );
                          } catch (e) {
                            // If an error occurs, log the error to the console.
                            print(e);
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
