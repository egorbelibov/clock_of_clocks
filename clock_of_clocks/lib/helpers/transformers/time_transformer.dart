import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../state/clock_state.dart' show amountOfDigits;

/// Breaksdown [time] into [amountOfDigits] digit values.
///
/// Formats hour to correct type (based on [is24HourFormat]).
/// Then, determines, stores and returns the corresponding digits ([newDigits]).
List<int> breakdownTimeIntoDigits({
  @required bool is24HourFormat,
  @required DateTime time,
}) {
  var formattedHour = double.parse(
    DateFormat(
      is24HourFormat ? 'HH' : 'hh',
    ).format(time),
  );

  List<int> newDigits = List(amountOfDigits);
  newDigits[0] = (formattedHour / 10).floor(); // First Hour Digit.
  newDigits[1] = (formattedHour % 10).floor(); // Second Hour Digit.
  newDigits[2] = (time.minute / 10).floor(); // First Minute Digit.
  newDigits[3] = time.minute % 10; // Second Minute Digit.
  return newDigits;
}
