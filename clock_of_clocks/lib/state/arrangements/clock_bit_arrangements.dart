import '../../helpers/arrangers/clock_group_arranger.dart';
import '../../models/analog_clock_model.dart';
import '../../styles/colors.dart';
import 'clock_hand_arrangements.dart';

/// Arrangement of a single bit(part) of the clock mesh.
/// 
/// Represents the states in which the clock hands can be in:
/// 
/// * [midBit]: Responsible for the middle part of the clock mesh.
///   This middle part is in between the digits and provides
///   additional time information.
enum ClockBitArrangement {
  midBit,
}

final Map<ClockBitArrangement, List<AnalogClockModel>> clockBitArrangements = {
  ClockBitArrangement.midBit: arrangeClockGroups(
    clockGroups: [
      ClockGroup(57, 57, ClockHandArrangement.s),
      ClockGroup(58, 58, ClockHandArrangement.n, handColor: lightTertiaryColor),
      ClockGroup(59, 60, ClockHandArrangement.n),
      ClockGroup(61, 61, ClockHandArrangement.n, handColor: lightTertiaryColor),
      ClockGroup(62, 62, ClockHandArrangement.n),
    ],
  )
};
