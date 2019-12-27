import 'package:flutter/widgets.dart';

import '../models/analog_clock_model.dart';
import '../state/clock_hand_arrangements.dart';
import '../state/clock_state.dart' show amountOfClocks;

/// Clock Group of [ClockHandArrangement]'s.
///
/// Facilitates grouping [AnalogClockModel] based on their [ClockHandArrangements]'s.
/// [first] and [last] represent the group bounds. Both are included in the group.
class ClockGroup {
  final int first;
  final int last;

  /// Used for all the [AnalogClockModel] with ids in the [first] to [last] range.
  final ClockHandArrangement arrangement;

  const ClockGroup(this.first, this.last, this.arrangement);
}

/// Arranges the provided List of [ClockGroup]'s into [arrangedClocks].
List<AnalogClockModel> arrangeClockGroups({
  @required List<ClockGroup> clockGroups,
}) {
  assert(clockGroups != null);

  List<AnalogClockModel> arrangedClocks = List(amountOfClocks);
  clockGroups.forEach(
    (clockGroup) {
      for (var i = clockGroup.first; i <= clockGroup.last; i++) {
        arrangedClocks[i] = AnalogClockModel(
          id: i,
          clockHands: clockHandArrangements[clockGroup.arrangement],
        );
      }
    },
  );

  return arrangedClocks;
}
