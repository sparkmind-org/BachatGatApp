import 'package:flutter/material.dart';

class IssueLoanScreen extends StatelessWidget {
  const IssueLoanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Issue Loan'),
      ),
      body: Center(
        child: Text('Issue Loan Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
