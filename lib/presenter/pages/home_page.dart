import 'package:flutter/material.dart';

import '../components/techfleet_trip_card/techfleet_trip_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isEnabled = false;
  bool _isAnimationFinished = false;

  void _handleSwitchTripCard() {
    setState(() {
      _isEnabled = !_isEnabled;
    });
  }

  void _handleAnimationTripCard() {
    setState(() {
      _isAnimationFinished = !_isAnimationFinished;
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
            TechfleetTripCard(
              tripDate: 'Hoje',
              onSwitch: _handleSwitchTripCard,
              isEnabled: _isEnabled,
              size: 0.93,
              // animationController: _handleAnimationTripCard,
              // isAnimationFinished: _isAnimationFinished,
              // isAnimationEnabled: true,
            ),
          ],
        ),
      ),
    );
  }
}
