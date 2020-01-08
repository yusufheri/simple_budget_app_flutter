import 'package:flutter/material.dart';

Color getColor(BuildContext context, double percent ) {
  if (percent >= 0.5) {
    return Theme.of(context).primaryColor;
  } else if (percent >=0.25) {
    return Colors.orange;
  } else {
    return Colors.red;
  }
}

Color getColorRadial(BuildContext context, double percent ) {
  if (percent >= 0.75) {
    return Colors.red;
  } else if (percent >=0.5) {
    return Colors.orange;
  } else {
    return Theme.of(context).primaryColor;
  }
}