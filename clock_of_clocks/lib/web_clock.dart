// Copyright 2019 Egor Belibov. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'containers/clock_mesh.dart';
import 'styles/colors.dart';
import 'state/theme_essentials.dart';
import 'extensions/apt_brightness.dart';

class WebClock extends StatefulWidget {
  @override
  _WebClockState createState() => _WebClockState();
}

class _WebClockState extends State<WebClock> {
  Widget _lightClock;
  Widget _darkClock;

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = subscribeToBrigthness(context);
    if (brightness.isLight()) {
      return _lightClock ??= _buildWebClock(context);
    } else {
      return _darkClock ??= _buildWebClock(context);
    }
  }

  Widget _buildWebClock(BuildContext context) {
    return Container(
      color: themeBasedColor(
        context,
        PaletteColor.backgroundColor,
        listen: false,
      ),
      child: ClockMesh(), // ClockMesh of analog clocks
    );
  }
}
