import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:flutter_web_sample/Core/RouteConfig.dart';

import 'Core/SharedManager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedManager.init();
  configureApp();
  runApp(const MyApp());
}
void configureApp() {
  setUrlStrategy(PathUrlStrategy());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Sample Project',
      onGenerateRoute: RouteConfig.generateRoute,
      initialRoute: '/',
    );
  }
}
