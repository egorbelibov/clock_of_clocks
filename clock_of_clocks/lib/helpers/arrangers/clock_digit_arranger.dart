import 'package:flutter/widgets.dart';

import '../../models/analog_clock_model.dart';
import '../../state/arrangements/clock_digit_arrangements.dart';
import '../../state/clock_state.dart' show amountOfDigits;

/// Represents the amount of clocks in a digit section.
/// TODO: show image url representing this (graphic representation).
const int amountOfClocksInDigit = 24;

/// Represents the bounds of a digit with a certain index.
class _DigitIndexBound {
  final int lowerBound;
  final int upperBound;

  const _DigitIndexBound(this.lowerBound, this.upperBound);
}

/// A [Map] of all digits [DigitIndexBound] and their bounds.
///
/// The amount of digits should be equivalent to [amountOfDigits].
/// The difference between the [upperBound] and [lowerBound]
/// should always be equivalent to the [amountOfClocksInDigit].
Map<int, _DigitIndexBound> _digitIndexBounds = {
  0: _DigitIndexBound(8, 31),
  1: _DigitIndexBound(32, 55),
  2: _DigitIndexBound(64, 87),
  3: _DigitIndexBound(88, 111),
};

/// Arranges a List<AnalogClockModel> based on the [digitIndex] and [digit].
List<AnalogClockModel> arrangeClockDigit({
  @required int digitIndex,
  @required int digit,
}) {
  assert(digitIndex >= 0 && digitIndex <= amountOfDigits);
  assert(digit >= 0 && digit <= 9);

  var digitIndexBounds = _digitIndexBounds[digitIndex];

  // Assigns a list of [ClockModel]'s arranged based on the provided [digit].
  List<AnalogClockModel> digitClockArrangements = List.from(
    arrangedClockDigits[digit],
    growable: false,
  );
  assert(digitClockArrangements.length == amountOfClocksInDigit);

  return _updateIndexes(
    lowerBound: digitIndexBounds.lowerBound,
    upperBound: digitIndexBounds.upperBound,
    clockModels: digitClockArrangements,
  );
}

/// Update Default Indexes [0..23] with corresponding [lowerBound..upperBound].
List<AnalogClockModel> _updateIndexes({
  @required int lowerBound,
  @required int upperBound,
  @required List<AnalogClockModel> clockModels,
}) {
  assert(lowerBound != null);
  assert(upperBound != null);
  assert(clockModels != null);

  for (var i = 0; i < amountOfClocksInDigit; i++) {
    assert(clockModels[i] != null);
    clockModels[i].id = lowerBound;
    assert(lowerBound <= upperBound);
    lowerBound++;
  }

  return clockModels;
}
