import 'package:flutter/material.dart';
import 'package:flutter_library/helpers/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TechfleetTripDetails extends StatelessWidget {
  const TechfleetTripDetails({
    Key? key,
    this.destination = 'Trabalho',
    this.startingPoint = 'Casa',
    this.beginHour = '08:00',
    this.endHour = '09:00',
  }) : super(key: key);

  final String destination;
  final String startingPoint;
  final String beginHour;
  final String endHour;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              startingPoint,
              style: TEXT_STYLE_BOLD_GREY,
            ),
            SizedBox(height: 5),
            Text(
              beginHour,
              style: TEXT_STYLE_LIGHT_GREY,
            ),
          ],
        ),
        SizedBox(width: 5),
        Icon(
          MdiIcons.arrowRightThin,
          color: GREY_COLOR_ICON,
          size: 30,
        ),
        SizedBox(width: 5),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              destination,
              style: TEXT_STYLE_BOLD_GREY,
            ),
            SizedBox(height: 5),
            Text(
              endHour,
              style: TEXT_STYLE_LIGHT_GREY,
            ),
          ],
        ),
      ],
    );
  }
}
