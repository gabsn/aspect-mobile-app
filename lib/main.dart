/// --------------------------------------------------
/// main.dart
/// -> where it all begins ...
/// --------------------------------------------------
///
/// Imports ------------------------------------------
///External
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// View
import 'package:aspect_mobile_app/view_model/screens_view_model.dart';
import 'package:aspect_mobile_app/view/screens/main/main_screen.dart';

/// Model
import 'package:aspect_mobile_app/model/constants/constants.dart';

import 'model/services/camera_service/camera_service.dart';
import 'model/services/service_locator.dart';

/// Imports ------------------------------------------

Future<void> main() async {
  //Initialize getIt
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();

  //Initialize the camera
  await getIt<CameraService>().initializeCamera();

  //Run the app
  runApp(const AspectMobileApp());
}

class AspectMobileApp extends StatelessWidget {
  final String title = kAppTitle;
  //late bool isUserAuthenticated;
  final bool isUserAuthenticated = false;

  const AspectMobileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ScreensChangeNotifier(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: kStyleGuideColorViolet,
          scaffoldBackgroundColor: kStyleGuideColorOnyx,
        ),
        initialRoute: MainScreen.id,
        routes: {
          MainScreen.id: (context) => const MainScreen(title: kAppTitle),
        }, //MainScreen(title: title),
      ),
    );
  }
}
