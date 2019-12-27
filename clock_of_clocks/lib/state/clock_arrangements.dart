import '../helpers/clock_group_arranger.dart';
import '../models/analog_clock_model.dart';
import 'clock_hand_arrangements.dart' show ClockHandArrangement;

enum ClockArrangement {
  defaultArrangement,
}

/// Represents various clock mesh arrangements.
///
/// NOTE: These arrangements don't cover digit representation, but they
/// could have a certain arrangement which reflects a certain time.
final Map<ClockArrangement, List<AnalogClockModel>> clockArrangements = {
  ClockArrangement.defaultArrangement: arrangeClockGroups(
    clockGroups: const [
      ClockGroup(0, 0, ClockHandArrangement.s_e_corner),
      ClockGroup(1, 6, ClockHandArrangement.n_s),
      ClockGroup(7, 7, ClockHandArrangement.n_e_corner),
      ClockGroup(8, 8, ClockHandArrangement.w_e),
      ClockGroup(9, 9, ClockHandArrangement.s_e_corner),
      ClockGroup(10, 13, ClockHandArrangement.n_s),
      ClockGroup(14, 14, ClockHandArrangement.n_e_corner),
      ClockGroup(15, 17, ClockHandArrangement.w_e),
      ClockGroup(18, 18, ClockHandArrangement.s_e_corner),
      ClockGroup(19, 20, ClockHandArrangement.n_s),
      ClockGroup(21, 21, ClockHandArrangement.n_e_corner),
      ClockGroup(22, 26, ClockHandArrangement.w_e),
      ClockGroup(27, 27, ClockHandArrangement.s_e_corner),
      ClockGroup(28, 28, ClockHandArrangement.n_e_corner),
      ClockGroup(29, 90, ClockHandArrangement.w_e),
      ClockGroup(91, 91, ClockHandArrangement.s_w_corner),
      ClockGroup(92, 92, ClockHandArrangement.n_w_corner),
      ClockGroup(93, 97, ClockHandArrangement.w_e),
      ClockGroup(98, 98, ClockHandArrangement.s_w_corner),
      ClockGroup(99, 100, ClockHandArrangement.n_s),
      ClockGroup(101, 101, ClockHandArrangement.n_w_corner),
      ClockGroup(102, 104, ClockHandArrangement.w_e),
      ClockGroup(105, 105, ClockHandArrangement.s_w_corner),
      ClockGroup(106, 109, ClockHandArrangement.n_s),
      ClockGroup(110, 111, ClockHandArrangement.n_w_corner),
      ClockGroup(111, 111, ClockHandArrangement.w_e),
      ClockGroup(112, 112, ClockHandArrangement.s_w_corner),
      ClockGroup(113, 118, ClockHandArrangement.n_s),
      ClockGroup(119, 119, ClockHandArrangement.n_w_corner),
    ],
  ),
};
