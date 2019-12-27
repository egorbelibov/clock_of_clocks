import 'dart:math';

/// Cardinal and Intercardinal Directions (🧭).
///
///   - NW N NE
///   - W. + .E
///   - SW S SE
///
/// - Cardinal Directions: [east, south, west, north].
/// - Intercardinal Directions: [nortWest, northEast, southWest, southEast].
enum Direction {
  east,
  southEast,
  south,
  southWest,
  west,
  northWest,
  north,
  northEast,
}

/// Clock Hand Direction Angles (Rad unit).
final Map<Direction, double> directionAngles = {
  Direction.east: 0,
  Direction.southEast: 7 * pi / 4,
  Direction.south: pi / 2,
  Direction.southWest: 5 * pi / 4,
  Direction.west: pi,
  Direction.northWest: 3 * pi / 4,
  Direction.north: 3 * pi / 2,
  Direction.northEast: pi / 4,
};
