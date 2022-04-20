import 'package:flutter/material.dart';
import 'package:flutter_library/helpers/constants.dart';
import 'package:flutter_switch/flutter_switch.dart';

class TechfleetTripCardHeader extends StatelessWidget {
  const TechfleetTripCardHeader({
    Key? key,
    this.topText = 'Hoje',
    this.bottomText = 'Qua, 24/03',
    this.switchLabel = 'Eu quero dirigir',
    required this.onSwitch,
    required this.isEnabled,
  }) : super(key: key);

  final String topText;
  final String bottomText;
  final String switchLabel;
  final Function onSwitch;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    const double SWITCH_HEIGHT = 22.0;
    const CARD_HEADER_HEIGHT = 70.0;

    return Container(
      padding: const EdgeInsets.only(
        right: 20,
        left: 20,
        top: 10,
        bottom: 6,
      ),
      height: CARD_HEADER_HEIGHT,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                topText,
                style: HEAD_TEXT_STYLE_GREY,
              ),
              SizedBox(height: 7),
              Text(
                bottomText,
                style: TEXT_STYLE_BLACK,
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    switchLabel,
                    style: isEnabled
                        ? HEAD_TEXT_STYLE_PRIMARY
                        : TEXT_STYLE_BOLD_LIGHT_GREY,
                  ),
                  SizedBox(width: 12),
                  FlutterSwitch(
                    height: SWITCH_HEIGHT,
                    activeColor: PRIMARY_COLOR,
                    width: 50.0,
                    value: isEnabled,
                    padding: 1.0,
                    onToggle: (val) async {
                      await onSwitch();
                    },
                  ),
                ],
              ),
              SizedBox(height: 7),
            ],
          ),
        ],
      ),
    );
  }
}
