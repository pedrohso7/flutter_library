import 'package:flutter/material.dart';
import 'package:flutter_library/helpers/constants.dart';

import '../../../../../../shared/techfleet_avatar.dart';

class TechfleetTripPassengers extends StatelessWidget {
  const TechfleetTripPassengers({
    Key? key,
    this.urlList = const [
      'assets/images/renan.png',
      'assets/images/maria.png',
      'assets/images/joana.png',
      'assets/images/felipe.png',
      'assets/images/felipe.png',
      'assets/images/felipe.png',
      'assets/images/felipe.png',
    ],
  }) : super(key: key);

  final List<String> urlList;

  @override
  Widget build(BuildContext context) {
    var surplus = urlList.length - 4;
    const double AVATAR_SIZE = 44;
    const double FACTOR = 12.0;
    return SizedBox(
      width: 220,
      height: AVATAR_SIZE,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Visibility(
            visible: urlList.length > 4,
            child: Transform.translate(
              offset: const Offset(-(2.65 * FACTOR), 0),
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
          ),
          Transform.translate(
            offset: (urlList.length > 4)
                ? const Offset(-(5 * FACTOR), 0)
                : const Offset(-(2.65 * FACTOR), 0),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              reverse: true,
              itemCount: urlList.length > 4 ? 4 : urlList.length,
              itemBuilder: (context, index) {
                return Transform.translate(
                  // Avatar offset.
                  offset: Offset((index * FACTOR), 0),
                  child: TechFleetAvatar(
                    size: AVATAR_SIZE,
                    uri: urlList[index],
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
