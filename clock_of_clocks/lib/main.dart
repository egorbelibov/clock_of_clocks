// Copyright 2019 Egor Belibov. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:clock_of_clocks/clock_wrapper.dart';
import 'package:flutter/foundation.dart'
    show kIsWeb, debugDefaultTargetPlatformOverride;
import 'package:flutter/widgets.dart';
import 'package:flutter_clock_helper/customizer.dart';
import 'package:flutter_clock_helper/model.dart' show ClockModel;

void main() {
  // A temporary measure until Platform supports web and TargetPlatform supports macOS.
  // TODO: Update this when TargetPlatform includes macOS.
  if (!kIsWeb && Platform.isMacOS) {
    // https://github.com/flutter/flutter/issues/31366
    // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override.
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }

  Widget _clockWrapper;
  runApp(ClockCustomizer(
    (ClockModel model) => _clockWrapper ??= ClockWrapper(model),
  ));
}
