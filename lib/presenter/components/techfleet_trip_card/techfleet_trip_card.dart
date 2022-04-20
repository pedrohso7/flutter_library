import 'package:flutter/material.dart';

import 'components/techfleet_trip_card_content/techfleet_trip_card_content.dart';
import 'components/techfleet_trip_card_header/techfleet_trip_card_header.dart';

class TechfleetTripCard extends StatelessWidget {
  const TechfleetTripCard({
    Key? key,
    required this.tripDate,
    required this.onSwitch,
    required this.onTapContent,
    required this.isEnabled,
    this.size = 0.93,
  }) : super(key: key);

  final String tripDate;
  final Function onSwitch;
  final Function onTapContent;
  final bool isEnabled;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: size,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        elevation: 16,
        color: Colors.white,
        child: Column(
          children: [
            TechfleetTripCardHeader(
              onSwitch: onSwitch,
              isEnabled: isEnabled,
            ),
            Visibility(
              visible: isEnabled,
              child: TweenAnimationBuilder(
                curve: Curves.fastOutSlowIn,
                tween: Tween(
                  begin: isEnabled ? 0.0 : 1.0,
                  end: isEnabled ? 1.0 : 0.0,
                ),
                duration: const Duration(milliseconds: 400),
                child: Column(
                  children: [
                    Divider(thickness: 1),
                    TechfleetTripCardContent(
                      onTapContent: onTapContent,
                    ),
                  ],
                ),
                builder: (context, double value, child) {
                  return Transform.scale(scale: value, child: child);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
