import 'package:flutter/material.dart';
import 'package:flutter_library/helpers/constants.dart';
import 'package:flutter_switch/flutter_switch.dart';

class TechfleetTripCardHeader extends StatelessWidget {
  const TechfleetTripCardHeader({
    Key? key,
    required this.onSwitch,
    required this.isEnabled,
    this.topText = 'Hoje',
    this.bottomText = 'Qua, 24/03',
    this.switchLabel = 'Eu quero dirigir',
  }) : super(key: key);

  final Function onSwitch;
  final bool isEnabled;
  final String topText;
  final String bottomText;
  final String switchLabel;

  @override
  Widget build(BuildContext context) {
    const double SWITCH_HEIGHT = 18.0;
    const CARD_HEADER_HEIGHT = 70.0;

    return Padding(
      padding: EdgeInsets.only(
        right: 16,
        left: 16,
        top: 16,
        bottom: isEnabled ? 6.0 : 22.0,
      ),
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
              SizedBox(height: 4),
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
                        : TEXT_STYLE_LIGHT_GREY,
                  ),
                  SizedBox(width: 12),
                  FlutterSwitch(
                    height: SWITCH_HEIGHT,
                    activeColor: PRIMARY_COLOR,
                    width: 40.0,
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
