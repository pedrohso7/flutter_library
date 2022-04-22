import 'package:flutter/material.dart';
import 'package:flutter_library/helpers/constants.dart';
import 'package:flutter_library/shared/techfleet_avatar.dart';

class TechfleetTripAvatars extends StatelessWidget {
  const TechfleetTripAvatars({
    Key? key,
    required this.urlList,
    required this.isPassengerCard,
  }) : super(key: key);

  final List<String> urlList;
  final bool isPassengerCard;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const WIDTH_BREAKPOINT = 360;
    int surplus = (size.width < WIDTH_BREAKPOINT)
        ? urlList.length - 3
        : urlList.length - 4;
    int avatarLimit = (size.width < WIDTH_BREAKPOINT) ? 3 : 4;
    double AVATAR_SIZE = (size.width < WIDTH_BREAKPOINT) ? 36 : 40;
    const double FACTOR = 11.0;
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: constraints.maxWidth * 0.5,
        height: AVATAR_SIZE,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            //Counter
            Visibility(
              visible: urlList.length > avatarLimit,
              child: Transform.translate(
                // offset: const Offset(/*-(2.65 * FACTOR)*/0, 0),
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
            //Avatars
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
