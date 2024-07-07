import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: SizedBox(
          child: Text(
            '404 Not found',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      );
}
