// Copyright 2019 Egor Belibov. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

import 'web_clock.dart';
import 'state/clock_state.dart';

class ClockOfClocks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PropertyChangeProvider<ClockState>(
      value: ClockState(),
      child: WebClock(),
    );
  }
}
