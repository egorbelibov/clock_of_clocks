// Copyright 2019 Egor Belibov. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'containers/clock_mesh.dart';
import 'styles/colors.dart';

class WebClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _renderWebClock(context);
  }

  Widget _renderWebClock(BuildContext context) {
    return Container(
      color: themeBasedColor(context, PaletteColor.backgroundColor),
      child: ClockMesh(), // ClockMesh of analog clocks
    );
  }
}
