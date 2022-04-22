import 'package:flutter/material.dart';
import 'package:flutter_library/helpers/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'components/techfleet_trip_details.dart';
import 'components/techfleet_trip_passengers.dart';

class TechfleetTripCardContent extends StatelessWidget {
  const TechfleetTripCardContent({
    Key? key,
    required this.onTapContent,
    required this.beginHour,
    required this.endHour,
    required this.urlList,
    required this.isHomeToWork,
  }) : super(key: key);

  final Function onTapContent;
  final String beginHour;
  final String endHour;
  final List<String> urlList;
  final bool isHomeToWork;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Future(() async {
          await onTapContent();
        });
      },
      child: Padding(
        padding: EdgeInsets.only(
          top: 16.0,
          bottom: 30.0,
          left: 24,
          right: (size.width < 500) ? 14 : 24,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TechfleetTripDetails(
                    isHomeToWork: isHomeToWork,
                    beginHour: beginHour,
                    endHour: endHour,
                  ),
                ),
                Expanded(
                  child: TechfleetTripPassengers(
                    urlList: urlList,
                  ),
                ),
              ],
            ),
            Transform.translate(
              offset: const Offset(5, 0),
              child: Container(
                alignment: Alignment.centerRight,
                child: Icon(
                  MdiIcons.chevronRight,
                  color: GREY_COLOR_ICON,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
