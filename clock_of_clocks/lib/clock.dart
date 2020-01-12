// Copyright 2019 Egor Belibov. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:clock_of_clocks/state/theme_essentials.dart';
import 'package:clock_of_clocks/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:intl/intl.dart';

import 'containers/clock_mesh.dart';
import 'extensions/apt_brightness.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  Widget lightClock;
  Widget darkClock;

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = subscribeToBrigthness(context);
    if (brightness.isLight()) {
      return lightClock ??= buildClock(context);
    } else {
      return darkClock ??= buildClock(context);
    }
  }

  Widget buildClock(BuildContext context) {
    final time = DateFormat.Hms().format(DateTime.now());
    return Semantics.fromProperties(
      properties: SemanticsProperties(
        label: 'Digital clock with time $time',
        value: time,
      ),
      child: Container(
        color: themeBasedColor(
          context,
          PaletteColor.backgroundColor,
          listen: false,
        ),
        child: ClockMesh(), // ClockMesh of [AnalogClock]'s
      ),
    );
  }
}
