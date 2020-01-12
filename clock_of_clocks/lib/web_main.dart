// Copyright 2019 Egor Belibov. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

import 'web_clock.dart';
import 'state/clock_state.dart';
import 'state/theme_essentials.dart';
import '../../../../.././../../../g_state/theme_essentials.dart' as web;

class ClockOfClocks extends StatefulWidget {
  @override
  _ClockOfClocksState createState() => _ClockOfClocksState();
}

class _ClockOfClocksState extends State<ClockOfClocks> {
  /// Holds theme essential information (dependent on `Theme.of(context)`).
  ThemeEssentials _themeEssentials = ThemeEssentials(
    initialBrightness: Brightness.light,
  );

  /// Holds the clock's state for the entire lifespan of the app.
  final ClockState _clockState = ClockState();

  /// Holds the entire clock app and its providers.
  Widget _clock;

  @override  
  void didChangeDependencies() {
    _themeEssentials.brightness = web.subscribeToBrigthness(context, listen: true);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _clock ??= PropertyChangeProvider<ThemeEssentials>(
      value: _themeEssentials,
      child: PropertyChangeProvider<ClockState>(
        value: _clockState,
        child: WebClock(),
      ),
    );
  }
}
