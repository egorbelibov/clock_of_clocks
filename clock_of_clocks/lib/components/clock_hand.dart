// Copyright 2019 Egor Belibov. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';

import '../styles/colors.dart';

class ClockHand extends StatelessWidget {
  final int id;
  final Color color;

  const ClockHand({
    @required this.id,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.55,
      heightFactor: 0.13,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: color ??
              themeBasedColor(
                context,
                PaletteColor.primaryColor,
                listen: false,
              ),
        ),
      ),
    );
  }
}
