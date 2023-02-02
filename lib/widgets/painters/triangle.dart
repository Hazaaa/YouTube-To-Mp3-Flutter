import 'package:flutter/material.dart';

class Triangle extends CustomPainter {
  late Paint _paint;

  Triangle() {
    _paint = Paint();
    _paint.color = Colors.red;
    _paint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(size.width / 2 + 5, size.width / 2);
    path.lineTo(0.0, -size.width / 16);
    path.lineTo(0.0, size.width);
    path.close();
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
