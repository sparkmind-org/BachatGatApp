import 'package:flutter/material.dart';
import 'app/routes.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(const BachatGatApp());
}

class BachatGatApp extends StatelessWidget {
  const BachatGatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BachatGat',
      theme: ThemeData(primarySwatch: Colors.teal),
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
