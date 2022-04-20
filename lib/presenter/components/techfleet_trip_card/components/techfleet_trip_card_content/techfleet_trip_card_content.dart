import 'package:flutter/material.dart';
import 'package:flutter_library/presenter/components/techfleet_trip_card/components/techfleet_trip_card_content/components/techfleet_trip_details.dart';
import 'package:flutter_library/presenter/components/techfleet_trip_card/components/techfleet_trip_card_content/components/techfleet_trip_passengers.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../helpers/constants.dart';

class TechfleetTripCardContent extends StatelessWidget {
  const TechfleetTripCardContent({
    Key? key,
    required this.onTapContent,
    this.destination = 'Trabalho',
    this.startingPoint = 'Casa',
    this.beginHour = '08:00',
    this.endHour = '09:00',
  }) : super(key: key);

  final Function onTapContent;
  final String destination;
  final String startingPoint;
  final String beginHour;
  final String endHour;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Future(() async {
          await onTapContent();
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          bottom: 35.0,
          left: 26,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TechfleetTripDetails(),
                TechfleetTripPassengers(),
              ],
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Icon(
                MdiIcons.chevronRight,
                color: GREY_COLOR_ICON,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
