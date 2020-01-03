// Copyright 2019 Egor Belibov. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math';

import 'package:flutter/widgets.dart' show required;
import 'package:intl/intl.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

import '../../state/clock_state.dart';

/// Total distance traveled by a minute hand, each second.
final radiansPerMinute = radians(360 / 60);

/// Total distance traveled by an hour hand, each minute.
final radiansPerHour = radians(360 / 60);

/// Total distance traveled by a day hand, each hour.
final radiansPerDay = radians(360 / 24);

/// Total distance traveled by a month hand, each day.
final radiansPerMonth = radians(360 / 31);

Map<int, double> timeToMidBitAngles({@required DateTime time}) {
  double minuteHandAngle = (time.second * radiansPerMinute) - (pi / 2);
  double hourHandAngle = (time.minute * radiansPerHour) - (pi / 2);
  double dayHandAngle = (time.hour * radiansPerDay) - (pi / 2);
  double monthHandAngle = (time.day * radiansPerMonth) - (pi / 2);
  return {
    58: minuteHandAngle,
    59: hourHandAngle,
    60: dayHandAngle,
    61: monthHandAngle,
  };
}

/// Breaksdown [time] into [amountOfDigits] digit values.
///
/// Formats hour to correct type (based on [is24HourFormat]).
/// Then, determines, stores and returns the corresponding digits ([newDigits]).
Map<int, int> timeToDigits(bool is24HourFormat, DateTime time) {
  var formattedHour = double.parse(
    DateFormat(
      is24HourFormat ? 'HH' : 'hh',
    ).format(time),
  );

  return {
    0: (formattedHour / 10).floor(), // First hour digit.
    1: (formattedHour % 10).floor(), // Second hour digit.
    2: (time.minute / 10).floor(), // First minute digit.
    3: time.minute % 10, // Second minute digit.
  };
}
