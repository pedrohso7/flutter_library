import 'package:flutter/material.dart';
import 'package:flutter_library/presenter/pages/teste.dart';

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
            TechfleetTripCard(
              beginDate: DateTime.now(),
              endDate: DateTime.now().add(
                Duration(
                  hours: 3,
                ),
              ),
              onSwitch: _handleSwitchTripCard,
              onTapContent: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Teste(title: 'teste'),
                  ),
                );
              },
              isEnabled: _isEnabled,
              // isPassengerCard: false,
            ),
          ],
        ),
      ),
    );
  }
}
