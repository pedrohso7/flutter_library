import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'components/techfleet_trip_card_content/techfleet_trip_card_content.dart';
import 'components/techfleet_trip_card_header/techfleet_trip_card_header.dart';

class TechfleetTripCard extends StatelessWidget {
  const TechfleetTripCard({
    Key? key,
    required this.beginDate,
    required this.endDate,
    required this.onSwitch,
    required this.onTapContent,
    required this.isEnabled,
    this.urlList = const [
      'assets/images/renan.png',
      'assets/images/maria.png',
      'assets/images/joana.png',
      'assets/images/felipe.png',
      'assets/images/felipe.png',
      'assets/images/felipe.png',
      'assets/images/felipe.png',
    ],
    this.isHomeToWork = true,
    this.switchLabel = 'Eu quero dirigir',
    this.size = 0.93,
  }) : super(key: key);

  final DateTime beginDate;
  final DateTime endDate;
  final Function onSwitch;
  final Function onTapContent;
  final bool isEnabled;
  final List<String> urlList;
  final bool isHomeToWork;
  final String switchLabel;
  final double size;

  @override
  Widget build(BuildContext context) {
    var data = this.getDataFromTripDates(beginDate, endDate);
    return Transform.scale(
      scale: size,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        elevation: 16,
        color: Colors.white,
        child: Column(
          children: [
            TechfleetTripCardHeader(
              onSwitch: onSwitch,
              isEnabled: isEnabled,
              switchLabel: switchLabel,
              topText: data['topTextHeader'],
              bottomText:
                  '${(data['beginDay']).substring(0, 3)}, ${data['date']}',
            ),
            Visibility(
              visible: isEnabled,
              child: TweenAnimationBuilder(
                curve: Curves.fastOutSlowIn,
                tween: Tween(
                  begin: isEnabled ? 0.0 : 1.0,
                  end: isEnabled ? 1.0 : 0.0,
                ),
                duration: const Duration(milliseconds: 400),
                child: Column(
                  children: [
                    Divider(thickness: 1),
                    TechfleetTripCardContent(
                      onTapContent: onTapContent,
                      isHomeToWork: isHomeToWork,
                      urlList: urlList,
                      beginHour: data['beginHour'],
                      endHour: data['endHour'],
                    ),
                  ],
                ),
                builder: (context, double value, child) {
                  return Transform.scale(scale: value, child: child);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String capitalize(String word) {
    return "${word[0].toUpperCase()}${word.substring(1).toLowerCase()}";
  }

  getDataFromTripDates(DateTime beginDate, DateTime endDate) {
    var data = {
      'beginDay': capitalize(
          (DateFormat('EEEE', "pt_BR").format(beginDate)).split('-')[0]),
      'beginHour':
          '${(beginDate.hour < 10) ? 0 : ''}${beginDate.hour}:${(beginDate.minute < 10) ? 0 : ''}${beginDate.minute}',
      'endHour':
          '${(endDate.hour < 10) ? 0 : ''}${endDate.hour}:${(endDate.minute < 10) ? 0 : ''}${endDate.minute}',
      'date':
          '${(beginDate.day < 10) ? 0 : ''}${beginDate.day}/${(beginDate.month < 10) ? 0 : ''}${beginDate.month}',
      'topTextHeader': capitalize(
          (DateFormat('EEEE', "pt_BR").format(beginDate)).split('-')[0]),
    };

    DateTime now = DateTime.now();
    DateTime currentDate = DateTime(now.year, now.month, now.day);
    DateTime beginDateWithoutTime =
        DateTime(beginDate.year, beginDate.month, beginDate.day);

    if (currentDate.isAtSameMomentAs(beginDateWithoutTime))
      data.update('topTextHeader', (value) => 'Hoje');

    DateTime tomorrowDateWithoutTime = currentDate.add(
      const Duration(days: 1),
    );

    if (tomorrowDateWithoutTime.isAtSameMomentAs(beginDateWithoutTime))
      data.update('topTextHeader', (value) => 'Amanhã');

    return data;
  }
}
