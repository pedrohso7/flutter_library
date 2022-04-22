import 'package:flutter/material.dart';
import 'package:flutter_library/helpers/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TechfleetTripDetails extends StatelessWidget {
  const TechfleetTripDetails({
    Key? key,
    required this.isHomeToWork,
    required this.beginHour,
    required this.endHour,
  }) : super(key: key);

  final bool isHomeToWork;
  final String beginHour;
  final String endHour;

  @override
  Widget build(BuildContext context) {
    double textScale = MediaQuery.of(context).textScaleFactor;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              (isHomeToWork) ? 'Casa' : 'Trabalho',
              style: TEXT_STYLE_BOLD_GREY,
              textScaleFactor: textScale > 1.0 ? 1.0 : textScale,
            ),
            SizedBox(height: 5),
            Text(
              beginHour,
              style: TEXT_STYLE_LIGHT_GREY,
              textScaleFactor: textScale > 1.0 ? 1.0 : textScale,
            ),
          ],
        ),
        SizedBox(width: 3),
        Icon(
          MdiIcons.arrowRightThin,
          color: GREY_COLOR_ICON,
          size: 20,
        ),
        SizedBox(width: 4),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              (isHomeToWork) ? 'Trabalho' : 'Casa',
              style: TEXT_STYLE_BOLD_GREY,
              textScaleFactor: textScale > 1.0 ? 1.0 : textScale,
            ),
            SizedBox(height: 5),
            Text(
              endHour,
              style: TEXT_STYLE_LIGHT_GREY,
              textScaleFactor: textScale > 1.0 ? 1.0 : textScale,
            ),
          ],
        ),
      ],
    );
  }
}
