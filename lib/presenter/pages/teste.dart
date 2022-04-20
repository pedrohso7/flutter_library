import 'package:flutter/material.dart';

import '../components/techfleet_trip_card/techfleet_trip_card.dart';

class Teste extends StatefulWidget {
  const Teste({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  bool _isEnabled = false;

  void _handleSwitchTripCard() {
    setState(() {
      _isEnabled = !_isEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Texto'),
            ),
          ],
        ),
      ),
    );
  }
}
