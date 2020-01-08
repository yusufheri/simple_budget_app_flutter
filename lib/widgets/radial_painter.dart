import 'dart:math';

import 'package:flutter/cupertino.dart';

class RadialPainter extends CustomPainter{

  final Color bgColor;
  final Color lineColor;
  final double percent;
  final double width;

  RadialPainter({this.bgColor, this.lineColor, this.percent, this.width});
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint bgLine = Paint()
    ..color  = bgColor
    ..strokeCap =StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = width;

    Paint completeLine = Paint()
    ..color  = lineColor
    ..strokeCap =StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = width;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    double sweepAngle = 2 * pi * percent;
    canvas.drawCircle(center, radius, bgLine);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius)
      , - pi /2, 
      sweepAngle, 
      false,
      completeLine);
   /*  canvas.drawImage(
        Image.asset("https://cdn.pixabay.com/photo/2016/08/19/12/59/clock-1605224_960_720.png"),     
       center, completeLine); */

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}