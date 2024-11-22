import 'package:flutter/material.dart';
import 'routes/route_generator.dart';
import 'error/error_screen.dart';

void main() {
  runApp(const BachatGatApp());
}

class BachatGatApp extends StatelessWidget {
  const BachatGatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BachatGat',
      theme: ThemeData(primarySwatch: Colors.teal),
      initialRoute: RouteGenerator.login,
     onGenerateRoute: RouteGenerator.generateRoute,
      onUnknownRoute: (settings) {
        // Handle completely unknown routes
        return MaterialPageRoute(
          builder: (context) => const ErrorScreen(),
        );
    },
    );
  }  
}