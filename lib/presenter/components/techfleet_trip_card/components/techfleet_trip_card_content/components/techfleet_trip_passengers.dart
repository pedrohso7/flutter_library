import 'package:flutter/material.dart';
import 'package:flutter_library/helpers/constants.dart';
import 'package:flutter_library/shared/techfleet_avatar.dart';

class TechfleetTripPassengers extends StatelessWidget {
  const TechfleetTripPassengers({
    Key? key,
    required this.urlList,
  }) : super(key: key);

  final List<String> urlList;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int surplus = (size.width < 500) ? urlList.length - 3 : urlList.length - 4;
    int avatarLimit = (size.width < 500) ? 3 : 4;
    double AVATAR_SIZE = (size.width < 500) ? 36 : 40;
    const double FACTOR = 11.0;
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: constraints.maxWidth * 0.5,
        height: AVATAR_SIZE,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Visibility(
              visible: urlList.length > avatarLimit,
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
                          textScaleFactor: 1.3,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: (urlList.length > avatarLimit)
                  ? const Offset(-(5 * FACTOR), 0)
                  : const Offset(-(2.65 * FACTOR), 0),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemCount:
                    urlList.length > avatarLimit ? avatarLimit : urlList.length,
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
    });
  }
}
