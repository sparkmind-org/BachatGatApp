import 'package:flutter/material.dart';

class LoanCollectionScreen extends StatelessWidget {
  const LoanCollectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan Collection'),
      ),
      body: Center(
        child: Text('Loan Collection Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
