// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:clock_of_clocks/state/clock_state.dart';
import 'package:clock_of_clocks/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:intl/intl.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

import 'containers/clock_mesh.dart';

class Clock extends StatelessWidget {
  final ClockModel model;

  const Clock(this.model);

  @override
  Widget build(BuildContext context) {
    // Not Mandatory. It's here just to ensure the right orientation is used.
    setPreferredOrientations();

    // Set model listener - contains info [temperature].
    model.addListener(() => _updateModel(context));
    _updateModel(context);

    // Build Clock.
    return renderWidget(context);
  }

  void setPreferredOrientations() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  void _updateModel(BuildContext context) {
    PropertyChangeProvider.of<ClockState>(
      context,
      listen: false,
    ).value.updateModel(model);
  }

  Widget renderWidget(BuildContext context) {
    final time = DateFormat.Hms().format(DateTime.now());
    return Semantics.fromProperties(
      properties: SemanticsProperties(
        label: 'Digital clock with time $time',
        value: time,
      ),
      child: Container(
        color: themeBasedColor(context, PaletteColor.backgroundColor),
        child: ClockMesh(), // ClockMesh of analog clocks
      ),
    );
  }
}
