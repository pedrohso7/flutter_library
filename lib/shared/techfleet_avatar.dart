import 'package:flutter/material.dart';
import 'package:flutter_library/helpers/constants.dart';

class TechFleetAvatar extends StatelessWidget {
  const TechFleetAvatar({
    Key? key,
    this.size = 48.0,
    this.uri = 'assets/images/avatar.png',
  }) : super(key: key);

  final double size;
  final String uri;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: PRIMARY_COLOR,
        child: uri != 'assets/images/avatar.png'
            ? Image.asset(
                uri,
                fit: BoxFit.cover,
                isAntiAlias: true,
                width: size,
                height: size,
              )
            // Image.network(
            //     uri,
            //     fit: BoxFit.cover,
            //   )
            : Image.asset(
                uri,
                fit: BoxFit.cover,
                width: size,
                height: size,
              ),
      ),
    );
  }
}
