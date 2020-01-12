// Copyright 2019 Egor Belibov. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clock_helper/model.dart' show ClockModel;
import 'package:property_change_notifier/property_change_notifier.dart';

import 'clock.dart';
import 'state/clock_state.dart';
import 'state/theme_essentials.dart';

/// Responsible for initializing and providing global clock state.
class ClockWrapper extends StatefulWidget {
  final ClockModel model;

  const ClockWrapper(this.model) : assert(model != null);

  @override
  _ClockWrapperState createState() => _ClockWrapperState();
}

class _ClockWrapperState extends State<ClockWrapper> {
  /// Holds theme essential information (dependent on `Theme.of(context)`).
  ThemeEssentials _themeEssentials = ThemeEssentials(
    initialBrightness: Brightness.light,
  );

  /// Holds the clock's state for the entire lifespan of the app.
  final ClockState _clockState = ClockState();

  /// Holds the entire clock app and its providers.
  Widget clock;

  @override
  void initState() {
    // Not Mandatory. It's here just to ensure the right orientation is used.
    _setPreferredOrientations();

    _clockState?.is24HourFormat = widget.model?.is24HourFormat;
    widget.model.addListener(() => _clockState?.updateModel(widget.model));

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _themeEssentials?.brightness = Theme.of(context).brightness;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return clock ??= _buildClock();
  }

  @override
  void dispose() {
    widget.model.dispose();
    super.dispose();
  }

  Widget _buildClock() {
    return PropertyChangeProvider<ThemeEssentials>(
      value: _themeEssentials,
      child: PropertyChangeProvider<ClockState>(
        value: _clockState,
        child: clock ??= Clock(),
      ),
    );
  }
}

/// Sets orientation in which app will run to **landscape**.
void _setPreferredOrientations() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}
