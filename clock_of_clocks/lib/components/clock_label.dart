// Copyright 2019 Egor Belibov. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import '../styles/colors.dart';

class ClockLabel extends StatelessWidget {
  final String label;
  ClockLabel(this.label) : assert(label != null);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2.0),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w900,
            color: themeBasedColor(context, PaletteColor.labelColor),
          ),
        ),
      ),
    );
  }
}
