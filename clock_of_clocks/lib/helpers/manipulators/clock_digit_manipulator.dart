import 'package:flutter/widgets.dart';

import '../../models/analog_clock_model.dart';
import '../../state/arrangements/clock_digit_arrangements.dart';
import '../../state/arrangements/clock_hand_arrangements.dart';
import '../../styles/colors.dart' show lightTertiaryColor;
import '../arrangers/clock_digit_arranger.dart' show amountOfClocksInDigit;
import '../arrangers/clock_group_arranger.dart';

/// Updates the [Color] of the [digit]'s clock hands.
///
/// It only updates the clocks in [digitClocks] that are a direct representation
/// of the given [digit] (All clocks are updated except the ones representing
/// empty space and surrounding space).
/// The update is made directly to the [digitClocks] reference, so return
/// values aren't necessary.
void colourDigit({
  @required int digit,
  @required List<AnalogClockModel> digitClocks,
  Color color = lightTertiaryColor,
}) {
  List<int> digitsToExclude = getDigitsToExclude(digit);
  // Iterates over all clock indexes in [digitClocks].
  for (var i = 0; i < amountOfClocksInDigit; i++) {
    if (!digitsToExclude.contains(i)) {
      digitClocks[i] = digitClocks[i].copyWith(handsNewColor: color);
    }
  }
}

/// Returns a List<int> (indexes) that do not directly represent the [digit].
List<int> getDigitsToExclude(int digit) {
  List<int> digitsToExclude = [];
  for (ClockGroup clockGroup in clockDigitArrangements[digit]) {
    if (clockGroup.arrangement == ClockHandArrangement.emptySpace ||
        clockGroup.arrangement == ClockHandArrangement.surroundingSpace) {
      for (var i = clockGroup.first; i <= clockGroup.last; i++) {
        digitsToExclude.add(i);
      }
    }
  }
  return digitsToExclude;
}
