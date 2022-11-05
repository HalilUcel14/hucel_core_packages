import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum CurrentDateTimeEnum {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
  ;
}

extension CurrentDateTimeEnumExtension on CurrentDateTimeEnum {
  DateTime get _currentDate => DateTime.now();

  String get currentDay => DateFormat('EEEEE').format(_currentDate);
  int get weekDay => _currentDate.weekday;

  CurrentDateTimeEnum get weekDayName => weekDay == 1
      ? CurrentDateTimeEnum.monday
      : weekDay == 2
          ? CurrentDateTimeEnum.tuesday
          : weekDay == 3
              ? CurrentDateTimeEnum.wednesday
              : weekDay == 4
                  ? CurrentDateTimeEnum.thursday
                  : weekDay == 5
                      ? CurrentDateTimeEnum.friday
                      : weekDay == 6
                          ? CurrentDateTimeEnum.saturday
                          : CurrentDateTimeEnum.sunday;
}
