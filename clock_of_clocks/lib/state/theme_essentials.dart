// Copyright 2019 Egor Belibov. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart' show Brightness, BuildContext;
import 'package:flutter/widgets.dart' show required;
import 'package:property_change_notifier/property_change_notifier.dart';

/// Subscribes [context.widget] to changes from [ThemeEssentials].
///
/// Every time a new value is notified, [context.widget]
/// will be re-built. If [listen] is false. It will only get
/// the value once.
Brightness subscribeToBrigthness(BuildContext context, {bool listen = true}) {
  ThemeEssentials themeEssentials = PropertyChangeProvider.of<ThemeEssentials>(
    context,
    listen: listen,
  ).value;
  assert(themeEssentials != null);
  assert(themeEssentials._brightness != null);
  return themeEssentials._brightness;
}

/// Holds Essential [Theme] Information.
///
/// It's much faster at **updating** & **notifying** than: `Theme.of(context)`
class ThemeEssentials extends PropertyChangeNotifier<String> {
  Brightness _brightness = Brightness.light;

  ThemeEssentials({@required Brightness initialBrightness}) {
    _brightness = initialBrightness;
  }

  get brightness => _brightness;
  set brightness(Brightness newBrightness) {
    if (newBrightness != _brightness) {
      _brightness = newBrightness;
      notifyListeners();
    }
  }
}
