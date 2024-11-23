import 'package:flutter/material.dart';
import 'routes/route.dart';

void main() {
  runApp(const BachatGatApp());
}

class BachatGatApp extends StatelessWidget {
  const BachatGatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'BachatGat',
      theme: ThemeData(primarySwatch: Colors.teal),
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}