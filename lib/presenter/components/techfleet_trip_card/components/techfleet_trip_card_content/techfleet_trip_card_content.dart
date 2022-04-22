import 'package:flutter/material.dart';
import 'package:flutter_library/helpers/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'components/techfleet_trip_details.dart';
import 'components/techfleet_trip_avatars.dart';

class TechfleetTripCardContent extends StatelessWidget {
  const TechfleetTripCardContent({
    Key? key,
    required this.onTapContent,
    required this.beginHour,
    required this.endHour,
    required this.urlList,
    required this.isHomeToWork,
    required this.isPassengerCard,
  }) : super(key: key);

  final Function onTapContent;
  final String beginHour;
  final String endHour;
  final List<String> urlList;
  final bool isHomeToWork;
  final bool isPassengerCard;

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
          right: (size.width < 200) ? 14 : 24,
        ),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: urlList.isEmpty ? 2 : 1,
                  child: TechfleetTripDetails(
                    isHomeToWork: isHomeToWork,
                    beginHour: beginHour,
                    endHour: endHour,
                  ),
                ),
                Expanded(
                  child: Builder(builder: (context) {
                    //It does not have any avatar
                    if (urlList.isEmpty) {
                      return Text(
                        (isPassengerCard)
                            ? 'Sem motoristas disponíveis'
                            : 'Sem passageiros disponíveis',
                        style: TEXT_STYLE_PRIMARY,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                      );
                    }
                    //Horizontal list of avatars
                    return TechfleetTripAvatars(
                      urlList: urlList,
                      isPassengerCard: isPassengerCard,
                    );
                  }),
                ),
              ],
            ),
            Visibility(
              visible: urlList.isNotEmpty,
              child: Transform.translate(
                offset: const Offset(5, 0),
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    MdiIcons.chevronRight,
                    color: GREY_COLOR_ICON,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
