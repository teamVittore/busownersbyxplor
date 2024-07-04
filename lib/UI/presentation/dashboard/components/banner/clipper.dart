import 'package:flutter/material.dart';

class Cliper extends CustomPainter {
  final double radius;
  final double nipHeight;
  final double nipWidth;
  final double nipRadius;

  Cliper({
    this.radius = 10,
    this.nipHeight = 10,
    this.nipWidth = 15,
    this.nipRadius = 3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.white;
    final Paint borderPaint = Paint()
      ..color = const Color(0xFFE9E9E9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    Path path = Path();
    path.lineTo(size.width - radius, 0);
    path.arcToPoint(Offset(size.width, radius),
        radius: Radius.circular(radius));
    path.lineTo(size.width, size.height - radius);
    path.arcToPoint(Offset(size.width - radius, size.height),
        radius: Radius.circular(radius));
    path.lineTo(radius + nipWidth, size.height);
    path.arcToPoint(Offset(nipWidth, size.height - radius),
        radius: Radius.circular(radius));
    path.lineTo(nipWidth, nipHeight);
    path.lineTo(nipRadius, nipRadius);
    path.arcToPoint(Offset(nipRadius, 0), radius: Radius.circular(nipRadius));
    path.close();

    // Draw background
    canvas.drawPath(path, paint);
    // Draw border
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
