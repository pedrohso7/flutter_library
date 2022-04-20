import 'package:flutter/material.dart';

import '../../pages/teste.dart';
import 'components/techfleet_trip_card_content/techfleet_trip_card_content.dart';
import 'components/techfleet_trip_card_header/techfleet_trip_card_header.dart';

class TechfleetTripCard extends StatelessWidget {
  const TechfleetTripCard({
    Key? key,
    required this.tripDate,
    required this.onSwitch,
    required this.isEnabled,
    this.size = 1,
  }) : super(key: key);

  final String tripDate;
  final Function onSwitch;
  final bool isEnabled;
  final double size;

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    const CARD_HEIGHT_WITH_CONTENT = 190.0;
    const CARD_HEIGHT_WITHOUT_CONTENT = 90.0;

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
                // onEnd: () => isAnimationFinished = isEnabled,
                curve: Curves.fastOutSlowIn,
                tween: Tween(
                  begin: isEnabled ? 0.0 : 1.0,
                  end: isEnabled ? 1.0 : 0.0,
                ),
                duration: const Duration(milliseconds: 300),
                child: Column(
                  children: [
                    Visibility(
                      visible: isEnabled,
                      child: Divider(thickness: 1),
                    ),
                    TechfleetTripCardContent(
                      isEnabled: isEnabled,
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
