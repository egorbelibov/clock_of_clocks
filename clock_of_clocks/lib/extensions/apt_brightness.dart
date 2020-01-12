// Copyright 2019 Egor Belibov. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui' show Brightness;

extension AptBrightness on Brightness {
  bool isLight() => this == Brightness.light;
}
