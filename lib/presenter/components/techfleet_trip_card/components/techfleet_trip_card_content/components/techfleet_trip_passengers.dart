import 'package:flutter/material.dart';
import 'package:flutter_library/helpers/constants.dart';

import '../../../../../../shared/techfleet_avatar.dart';

class TechfleetTripPassengers extends StatelessWidget {
  const TechfleetTripPassengers({
    Key? key,
    this.uriList = const [
      'assets/images/renan.png',
      'assets/images/maria.png',
      'assets/images/joana.png',
      'assets/images/felipe.png',
      'assets/images/felipe.png',
      'assets/images/felipe.png',
      'assets/images/felipe.png',
    ],
  }) : super(key: key);

  final List<String> uriList;

  @override
  Widget build(BuildContext context) {
    var surplus = uriList.length - 4;
    const double AVATAR_SIZE = 49;
    return SizedBox(
      width: 220,
      height: AVATAR_SIZE,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Transform.translate(
            offset: const Offset(-(2.65 * 14.0), 0),
            child: Container(
              alignment: Alignment.centerRight,
              child: ClipOval(
                child: Material(
                  color: PRIMARY_COLOR,
                  child: Container(
                    alignment: Alignment.center,
                    width: AVATAR_SIZE,
                    height: AVATAR_SIZE,
                    child: Text(
                      '+$surplus',
                      style: TEXT_STYLE_BOLD_WHITE,
                      textScaleFactor: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(-(5 * 14.0), 0),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              reverse: true,
              itemCount: uriList.length > 4 ? 4 : uriList.length,
              itemBuilder: (context, index) {
                return Transform.translate(
                  // Avatar offset. It makes
                  offset: Offset((index * 14.0), 0),
                  child: TechFleetAvatar(
                    size: AVATAR_SIZE,
                    uri: uriList[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
