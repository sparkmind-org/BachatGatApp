import 'package:flutter/material.dart';

class MembersListScreen extends StatelessWidget {
  const MembersListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Members List'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add-member');
          },
          child: const Text('Add Member'),
        ),
      ),
    );
  }
}
