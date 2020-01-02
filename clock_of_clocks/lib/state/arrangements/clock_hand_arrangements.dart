import '../../helpers/cardinal_directions.dart';
import '../../models/clock_hand_model.dart';
import '../../styles/colors.dart';

/// Arrangement of Clock Hand Cardinal and Intercardinal Directions (🧭).
///
/// Represents the states in which the clock hands can be in:
///
/// * Stacked (Cardinal) states (all hands arranged in the same direction):
///   - [e]:   -
///   - [s]:  ╷
///   - [w]: -
///   - [n]:  ╵
///
/// * Stacked (Intercadinal) states:
///   - [nw]: ↖
///   - [ne]: ↗
///   - [sw]: ↙
///   - [se]: ↘
///
/// * Corner states:
///   - [n_w_corner]: ┛
///   - [n_e_corner]: ┗
///   - [s_w_corner]: ┓
///   - [s_e_corner]: ┏
///
/// * Cardinal-to-Cardinal states:
///   - [n_s]: ┃
///   - [w_e]: ━
///
/// * Intercardinal-to-Intercardinal states:
///   - [nw_se]: ╲
///   - [sw_ne]: ╱
///   - [nw_ne]: ⌄
///   - [sw_se]: ⌃
///
/// * Cardinal-to-Intercardinal states:
///   All of them look something like this: ∠
///   Didn't find symbols, but it shouldn't be hard to imagine 🤪).
///   - [e_se], [e_sw], [e_ne], [e_nw].
///   - [s_se], [s_sw], [s_ne], [s_nw].
///   - [w_se], [w_sw], [w_ne], [w_nw].
///   - [n_se], [n_sw], [n_ne], [n_nw].
///
/// * Empty space (normally, inside digits where some of the clocks
///  aren't used to represent part of the digit).
///   - [emptySpace]
///
/// * Surrounding space (normally, above and bellow the digit).
///   - [surroundingSpace]
enum ClockHandArrangement {
  e,
  s,
  w,
  n,
  nw,
  ne,
  sw,
  se,
  n_w_corner,
  n_e_corner,
  s_w_corner,
  s_e_corner,
  n_s,
  w_e,
  nw_se,
  sw_ne,
  nw_ne,
  sw_se,
  e_se,
  e_sw,
  e_ne,
  e_nw,
  s_se,
  s_sw,
  s_ne,
  s_nw,
  w_se,
  w_sw,
  w_ne,
  w_nw,
  n_se,
  n_sw,
  n_ne,
  n_nw,
  emptySpace,
  surroundingSpace,
}

final Map<ClockHandArrangement, List<ClockHandModel>> clockHandArrangements = {
  // Stacked (Cardinal) states:
  ClockHandArrangement.e: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.east]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.east]),
  ],
  ClockHandArrangement.s: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.south]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.south]),
  ],
  ClockHandArrangement.w: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.west]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.west]),
  ],
  ClockHandArrangement.n: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.north]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.north]),
  ],

  // Stacked (Intercardinal) states:
  ClockHandArrangement.nw: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.northWest]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.northWest]),
  ],
  ClockHandArrangement.ne: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.northEast]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.northEast]),
  ],
  ClockHandArrangement.sw: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.southWest]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.southWest]),
  ],
  ClockHandArrangement.se: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.southEast]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.southEast]),
  ],

  // Corner states:
  ClockHandArrangement.n_w_corner: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.north]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.west]),
  ],
  ClockHandArrangement.n_e_corner: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.north]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.east]),
  ],
  ClockHandArrangement.s_w_corner: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.south]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.west]),
  ],
  ClockHandArrangement.s_e_corner: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.south]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.east]),
  ],

  // Cardinal-to-Cardinal states:
  ClockHandArrangement.n_s: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.north]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.south]),
  ],
  ClockHandArrangement.w_e: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.west]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.east]),
  ],

  // Intercardinal-to-Intercardinal states:
  ClockHandArrangement.nw_se: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.northWest]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.southEast]),
  ],
  ClockHandArrangement.sw_ne: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.southWest]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.northEast]),
  ],
  ClockHandArrangement.nw_ne: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.northWest]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.northEast]),
  ],
  ClockHandArrangement.sw_se: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.southWest]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.southEast]),
  ],

  // Cardinal-to-Intercardinal states:
  // e_..
  ClockHandArrangement.e_se: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.east]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.southEast]),
  ],
  ClockHandArrangement.e_sw: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.east]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.southWest]),
  ],
  ClockHandArrangement.e_ne: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.east]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.northEast]),
  ],
  ClockHandArrangement.e_nw: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.east]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.northWest]),
  ],
  // s_..
  ClockHandArrangement.s_se: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.south]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.southEast]),
  ],
  ClockHandArrangement.s_sw: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.south]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.southWest]),
  ],
  ClockHandArrangement.s_ne: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.south]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.northEast]),
  ],
  ClockHandArrangement.s_nw: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.south]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.northWest]),
  ],
  // w_..
  ClockHandArrangement.w_se: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.west]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.southEast]),
  ],
  ClockHandArrangement.w_sw: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.west]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.southWest]),
  ],
  ClockHandArrangement.w_ne: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.west]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.northEast]),
  ],
  ClockHandArrangement.w_nw: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.west]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.northWest]),
  ],
  // n_..
  ClockHandArrangement.n_se: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.north]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.southEast]),
  ],
  ClockHandArrangement.n_sw: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.north]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.southWest]),
  ],
  ClockHandArrangement.n_ne: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.north]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.northEast]),
  ],
  ClockHandArrangement.n_nw: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.north]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.northWest]),
  ],

  // Empty Space states:
  ClockHandArrangement.emptySpace: [
    ClockHandModel(
      id: 0,
      angle: directionAngles[Direction.west],
      color: emptySpaceHandColor,
    ),
    ClockHandModel(
      id: 1,
      angle: directionAngles[Direction.west],
      color: emptySpaceHandColor,
    ),
  ],

  // Surrounding Space states:
  ClockHandArrangement.surroundingSpace: [
    ClockHandModel(id: 0, angle: directionAngles[Direction.west]),
    ClockHandModel(id: 1, angle: directionAngles[Direction.east]),
  ]
};
