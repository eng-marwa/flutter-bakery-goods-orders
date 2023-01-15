import 'package:flutter/material.dart';
import 'package:hnflutter_challenge/di/module.dart';
import 'package:hnflutter_challenge/resources/route_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Routes.getRoute,
      initialRoute: Routes.homeRoute,
    );
  }
}
