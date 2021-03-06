// Copyright 2019 Egor Belibov. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import '../../helpers/arrangers/clock_group_arranger.dart';
import '../../models/analog_clock_model.dart';
import 'clock_hand_arrangements.dart' show ClockHandArrangement;

/// Holds an arranged list of [AnalogClockModel]'s for all 10 digits (0-9).
///
/// Each digit is arranged based on the default [clockGroups]
/// from [clockDigitArrangements].
final Map<int, List<AnalogClockModel>> arrangedClockDigits = {
  0: arrangeClockGroups(clockGroups: clockDigitArrangements[0]),
  1: arrangeClockGroups(clockGroups: clockDigitArrangements[1]),
  2: arrangeClockGroups(clockGroups: clockDigitArrangements[2]),
  3: arrangeClockGroups(clockGroups: clockDigitArrangements[3]),
  4: arrangeClockGroups(clockGroups: clockDigitArrangements[4]),
  5: arrangeClockGroups(clockGroups: clockDigitArrangements[5]),
  6: arrangeClockGroups(clockGroups: clockDigitArrangements[6]),
  7: arrangeClockGroups(clockGroups: clockDigitArrangements[7]),
  8: arrangeClockGroups(clockGroups: clockDigitArrangements[8]),
  9: arrangeClockGroups(clockGroups: clockDigitArrangements[9]),
};

/// Holds all the default clock hand values for all 10 digits (0-9).
///
/// For simplicity, these clock hand values are grouped into
/// [ClockGroup]'s that share the same [ClockHandArrangement]'s.
final Map<int, List<ClockGroup>> clockDigitArrangements = {
  // DIGIT: 0
  0: const [
    ClockGroup(0, 0, ClockHandArrangement.surroundingSpace),
    ClockGroup(1, 1, ClockHandArrangement.s_e_corner),
    ClockGroup(2, 5, ClockHandArrangement.n_s),
    ClockGroup(6, 6, ClockHandArrangement.n_e_corner),
    ClockGroup(7, 8, ClockHandArrangement.surroundingSpace),
    ClockGroup(9, 9, ClockHandArrangement.w_e),
    ClockGroup(10, 10, ClockHandArrangement.s),
    ClockGroup(11, 12, ClockHandArrangement.n_s),
    ClockGroup(13, 13, ClockHandArrangement.n),
    ClockGroup(14, 14, ClockHandArrangement.w_e),
    ClockGroup(15, 16, ClockHandArrangement.surroundingSpace),
    ClockGroup(17, 17, ClockHandArrangement.s_w_corner),
    ClockGroup(18, 21, ClockHandArrangement.n_s),
    ClockGroup(22, 22, ClockHandArrangement.n_w_corner),
    ClockGroup(23, 23, ClockHandArrangement.surroundingSpace),
  ],

  // DIGIT: 1
  1: const [
    ClockGroup(0, 0, ClockHandArrangement.surroundingSpace),
    ClockGroup(1, 2, ClockHandArrangement.emptySpace),
    ClockGroup(3, 3, ClockHandArrangement.e_ne),
    ClockGroup(4, 6, ClockHandArrangement.emptySpace),
    ClockGroup(7, 8, ClockHandArrangement.surroundingSpace),
    ClockGroup(9, 9, ClockHandArrangement.emptySpace),
    ClockGroup(10, 10, ClockHandArrangement.sw_ne),
    ClockGroup(11, 11, ClockHandArrangement.s_w_corner),
    ClockGroup(12, 13, ClockHandArrangement.n_s),
    ClockGroup(14, 14, ClockHandArrangement.n_e_corner),
    ClockGroup(15, 16, ClockHandArrangement.surroundingSpace),
    ClockGroup(17, 17, ClockHandArrangement.s_sw),
    ClockGroup(18, 21, ClockHandArrangement.n_s),
    ClockGroup(22, 22, ClockHandArrangement.n_w_corner),
    ClockGroup(23, 23, ClockHandArrangement.surroundingSpace),
  ],

  // DIGIT: 2
  2: const [
    ClockGroup(0, 0, ClockHandArrangement.surroundingSpace),
    ClockGroup(1, 1, ClockHandArrangement.s_e_corner),
    ClockGroup(2, 2, ClockHandArrangement.n_e_corner),
    ClockGroup(3, 3, ClockHandArrangement.s_e_corner),
    ClockGroup(4, 5, ClockHandArrangement.n_s),
    ClockGroup(6, 6, ClockHandArrangement.n_e_corner),
    ClockGroup(7, 8, ClockHandArrangement.surroundingSpace),
    ClockGroup(9, 9, ClockHandArrangement.w_e),
    ClockGroup(10, 10, ClockHandArrangement.s_w_corner),
    ClockGroup(11, 11, ClockHandArrangement.n_w_corner),
    ClockGroup(12, 12, ClockHandArrangement.s_e_corner),
    ClockGroup(13, 13, ClockHandArrangement.n_e_corner),
    ClockGroup(14, 14, ClockHandArrangement.w_e),
    ClockGroup(15, 16, ClockHandArrangement.surroundingSpace),
    ClockGroup(17, 17, ClockHandArrangement.s_w_corner),
    ClockGroup(18, 19, ClockHandArrangement.n_s),
    ClockGroup(20, 20, ClockHandArrangement.n_w_corner),
    ClockGroup(21, 21, ClockHandArrangement.s_w_corner),
    ClockGroup(22, 22, ClockHandArrangement.n_w_corner),
    ClockGroup(23, 23, ClockHandArrangement.surroundingSpace),
  ],

  // DIGIT: 3
  3: const [
    ClockGroup(0, 0, ClockHandArrangement.surroundingSpace),
    ClockGroup(1, 1, ClockHandArrangement.s_e_corner),
    ClockGroup(2, 2, ClockHandArrangement.n_e_corner),
    ClockGroup(3, 3, ClockHandArrangement.s_e_corner),
    ClockGroup(4, 4, ClockHandArrangement.n_e_corner),
    ClockGroup(5, 5, ClockHandArrangement.s_e_corner),
    ClockGroup(6, 6, ClockHandArrangement.n_e_corner),
    ClockGroup(7, 8, ClockHandArrangement.surroundingSpace),
    ClockGroup(9, 9, ClockHandArrangement.w_e),
    ClockGroup(10, 10, ClockHandArrangement.s_w_corner),
    ClockGroup(11, 11, ClockHandArrangement.n_w_corner),
    ClockGroup(12, 12, ClockHandArrangement.s_w_corner),
    ClockGroup(13, 13, ClockHandArrangement.n_w_corner),
    ClockGroup(14, 14, ClockHandArrangement.w_e),
    ClockGroup(15, 16, ClockHandArrangement.surroundingSpace),
    ClockGroup(17, 17, ClockHandArrangement.s_w_corner),
    ClockGroup(18, 21, ClockHandArrangement.n_s),
    ClockGroup(22, 22, ClockHandArrangement.n_w_corner),
    ClockGroup(23, 23, ClockHandArrangement.surroundingSpace),
  ],

  // DIGIT:4
  4: const [
    ClockGroup(0, 0, ClockHandArrangement.surroundingSpace),
    ClockGroup(1, 1, ClockHandArrangement.s_e_corner),
    ClockGroup(2, 3, ClockHandArrangement.n_s),
    ClockGroup(4, 4, ClockHandArrangement.n_e_corner),
    ClockGroup(5, 6, ClockHandArrangement.emptySpace),
    ClockGroup(7, 8, ClockHandArrangement.surroundingSpace),
    ClockGroup(9, 9, ClockHandArrangement.s_w_corner),
    ClockGroup(10, 10, ClockHandArrangement.n_s),
    ClockGroup(11, 11, ClockHandArrangement.n_e_corner),
    ClockGroup(12, 12, ClockHandArrangement.s_w_corner),
    ClockGroup(13, 13, ClockHandArrangement.n_s),
    ClockGroup(14, 14, ClockHandArrangement.n_e_corner),
    ClockGroup(15, 16, ClockHandArrangement.surroundingSpace),
    ClockGroup(17, 17, ClockHandArrangement.s_w_corner),
    ClockGroup(18, 21, ClockHandArrangement.n_s),
    ClockGroup(22, 22, ClockHandArrangement.n_w_corner),
    ClockGroup(23, 23, ClockHandArrangement.surroundingSpace),
  ],

  // DIGIT: 5
  5: const [
    ClockGroup(0, 0, ClockHandArrangement.surroundingSpace),
    ClockGroup(1, 1, ClockHandArrangement.s_e_corner),
    ClockGroup(2, 3, ClockHandArrangement.n_s),
    ClockGroup(4, 4, ClockHandArrangement.n_e_corner),
    ClockGroup(5, 5, ClockHandArrangement.s_e_corner),
    ClockGroup(6, 6, ClockHandArrangement.n_e_corner),
    ClockGroup(7, 8, ClockHandArrangement.surroundingSpace),
    ClockGroup(9, 9, ClockHandArrangement.w_e),
    ClockGroup(10, 10, ClockHandArrangement.s_e_corner),
    ClockGroup(11, 11, ClockHandArrangement.n_e_corner),
    ClockGroup(12, 12, ClockHandArrangement.s_w_corner),
    ClockGroup(13, 13, ClockHandArrangement.n_w_corner),
    ClockGroup(14, 14, ClockHandArrangement.w_e),
    ClockGroup(15, 16, ClockHandArrangement.surroundingSpace),
    ClockGroup(17, 17, ClockHandArrangement.s_w_corner),
    ClockGroup(18, 18, ClockHandArrangement.n_w_corner),
    ClockGroup(19, 19, ClockHandArrangement.s_w_corner),
    ClockGroup(20, 21, ClockHandArrangement.n_s),
    ClockGroup(22, 22, ClockHandArrangement.n_w_corner),
    ClockGroup(23, 23, ClockHandArrangement.surroundingSpace),
  ],

  // DIGIT: 6
  6: const [
    ClockGroup(0, 0, ClockHandArrangement.surroundingSpace),
    ClockGroup(1, 1, ClockHandArrangement.s_e_corner),
    ClockGroup(2, 5, ClockHandArrangement.n_s),
    ClockGroup(6, 6, ClockHandArrangement.n_e_corner),
    ClockGroup(7, 8, ClockHandArrangement.surroundingSpace),
    ClockGroup(9, 9, ClockHandArrangement.w_e),
    ClockGroup(10, 10, ClockHandArrangement.s_e_corner),
    ClockGroup(11, 11, ClockHandArrangement.n_s),
    ClockGroup(12, 12, ClockHandArrangement.n_e_corner),
    ClockGroup(13, 13, ClockHandArrangement.nw_se),
    ClockGroup(14, 14, ClockHandArrangement.w_e),
    ClockGroup(15, 16, ClockHandArrangement.surroundingSpace),
    ClockGroup(17, 17, ClockHandArrangement.s_w_corner),
    ClockGroup(18, 18, ClockHandArrangement.n_w_corner),
    ClockGroup(19, 19, ClockHandArrangement.emptySpace),
    ClockGroup(20, 20, ClockHandArrangement.s_w_corner),
    ClockGroup(21, 21, ClockHandArrangement.n_s),
    ClockGroup(22, 22, ClockHandArrangement.n_w_corner),
    ClockGroup(23, 23, ClockHandArrangement.surroundingSpace),
  ],

  // DIGIT: 7
  7: const [
    ClockGroup(0, 0, ClockHandArrangement.surroundingSpace),
    ClockGroup(1, 1, ClockHandArrangement.s_e_corner),
    ClockGroup(2, 2, ClockHandArrangement.n_e_corner),
    ClockGroup(3, 3, ClockHandArrangement.emptySpace),
    ClockGroup(4, 4, ClockHandArrangement.s_ne),
    ClockGroup(5, 5, ClockHandArrangement.n_s),
    ClockGroup(6, 6, ClockHandArrangement.n_e_corner),
    ClockGroup(7, 8, ClockHandArrangement.surroundingSpace),
    ClockGroup(9, 9, ClockHandArrangement.w_e),
    ClockGroup(10, 10, ClockHandArrangement.s_w_corner),
    ClockGroup(11, 11, ClockHandArrangement.n_sw),
    ClockGroup(12, 12, ClockHandArrangement.s_ne),
    ClockGroup(13, 13, ClockHandArrangement.n_s),
    ClockGroup(14, 14, ClockHandArrangement.n_w_corner),
    ClockGroup(15, 16, ClockHandArrangement.surroundingSpace),
    ClockGroup(17, 17, ClockHandArrangement.s_w_corner),
    ClockGroup(18, 18, ClockHandArrangement.n_s),
    ClockGroup(19, 19, ClockHandArrangement.n_sw),
    ClockGroup(20, 22, ClockHandArrangement.emptySpace),
    ClockGroup(23, 23, ClockHandArrangement.surroundingSpace),
  ],

  // DIGIT: 8
  8: const [
    ClockGroup(0, 0, ClockHandArrangement.surroundingSpace),
    ClockGroup(1, 1, ClockHandArrangement.s_e_corner),
    ClockGroup(2, 2, ClockHandArrangement.n_s),
    ClockGroup(3, 3, ClockHandArrangement.n_se),
    ClockGroup(4, 4, ClockHandArrangement.s_ne),
    ClockGroup(5, 5, ClockHandArrangement.n_s),
    ClockGroup(6, 6, ClockHandArrangement.n_e_corner),
    ClockGroup(7, 8, ClockHandArrangement.surroundingSpace),
    ClockGroup(9, 9, ClockHandArrangement.w_e),
    ClockGroup(10, 10, ClockHandArrangement.s),
    ClockGroup(11, 11, ClockHandArrangement.sw_se),
    ClockGroup(12, 12, ClockHandArrangement.nw_ne),
    ClockGroup(13, 13, ClockHandArrangement.n),
    ClockGroup(14, 14, ClockHandArrangement.w_e),
    ClockGroup(15, 16, ClockHandArrangement.surroundingSpace),
    ClockGroup(17, 17, ClockHandArrangement.s_w_corner),
    ClockGroup(18, 18, ClockHandArrangement.n_s),
    ClockGroup(19, 19, ClockHandArrangement.n_sw),
    ClockGroup(20, 20, ClockHandArrangement.s_nw),
    ClockGroup(21, 21, ClockHandArrangement.n_s),
    ClockGroup(22, 22, ClockHandArrangement.n_w_corner),
    ClockGroup(23, 23, ClockHandArrangement.surroundingSpace),
  ],

  // DIGIT: 9
  9: const [
    ClockGroup(0, 0, ClockHandArrangement.surroundingSpace),
    ClockGroup(1, 1, ClockHandArrangement.s_e_corner),
    ClockGroup(2, 3, ClockHandArrangement.n_s),
    ClockGroup(4, 4, ClockHandArrangement.n_e_corner),
    ClockGroup(5, 5, ClockHandArrangement.s_e_corner),
    ClockGroup(6, 6, ClockHandArrangement.n_e_corner),
    ClockGroup(7, 8, ClockHandArrangement.surroundingSpace),
    ClockGroup(9, 9, ClockHandArrangement.w_e),
    ClockGroup(10, 10, ClockHandArrangement.s),
    ClockGroup(11, 11, ClockHandArrangement.n),
    ClockGroup(12, 12, ClockHandArrangement.s_w_corner),
    ClockGroup(13, 13, ClockHandArrangement.n_w_corner),
    ClockGroup(14, 14, ClockHandArrangement.w_e),
    ClockGroup(15, 16, ClockHandArrangement.surroundingSpace),
    ClockGroup(17, 17, ClockHandArrangement.s_w_corner),
    ClockGroup(18, 21, ClockHandArrangement.n_s),
    ClockGroup(22, 22, ClockHandArrangement.n_w_corner),
    ClockGroup(23, 23, ClockHandArrangement.surroundingSpace),
  ],
};
