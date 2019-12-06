import 'package:flutter/widgets.dart';

import '../styles/colors.dart';

class ClockHand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.55, // TODO: Experiment with other values - like 0.5 and 0.6
      heightFactor: 0.12,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: color(context, PaletteColor.primaryColor),
        ),
      ),
    );
  }
}
