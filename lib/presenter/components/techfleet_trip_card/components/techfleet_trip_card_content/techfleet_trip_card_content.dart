import 'package:flutter/material.dart';
import 'package:flutter_library/presenter/components/techfleet_trip_card/components/techfleet_trip_card_content/components/techfleet_trip_details.dart';
import 'package:flutter_library/presenter/components/techfleet_trip_card/components/techfleet_trip_card_content/components/techfleet_trip_passengers.dart';

class TechfleetTripCardContent extends StatelessWidget {
  const TechfleetTripCardContent({
    Key? key,
    this.destination = 'Trabalho',
    this.startingPoint = 'Casa',
    this.beginHour = '08:00',
    this.endHour = '09:00',
    required this.isEnabled,
  }) : super(key: key);

  final String destination;
  final String startingPoint;
  final String beginHour;
  final String endHour;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    const CARD_CONTENT_HEIGHT = 95.0;

    return AnimatedContainer(
      curve: Curves.ease,
      duration: const Duration(milliseconds: 400),
      padding: const EdgeInsets.only(
        left: 24,
        top: 17,
      ),
      height: isEnabled ? CARD_CONTENT_HEIGHT : 0,
      child: TweenAnimationBuilder(
        curve: Curves.fastOutSlowIn,
        tween: Tween(
          begin: isEnabled ? 0.0 : 1.0,
          end: isEnabled ? 1.0 : 0.0,
        ),
        duration: const Duration(milliseconds: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TechfleetTripDetails(),
            TechfleetTripPassengers(),
          ],
        ),
        builder: (context, double value, child) {
          return Transform.scale(scale: value, child: child);
        },
      ),
    );
  }
}