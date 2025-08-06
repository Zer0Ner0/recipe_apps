import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class DocumentIcon extends StatelessWidget {
  final double size;
  final Color color;

  const DocumentIcon({
    super.key,
    this.size = 16,
    this.color = AppColors.secondaryOrange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: DocumentIconPainter(color),
      ),
    );
  }
}

class DocumentIconPainter extends CustomPainter {
  final Color color;

  DocumentIconPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    // Document body shape
    path.moveTo(size.width * 0.13, size.height * 0.08);
    path.lineTo(size.width * 0.51, size.height * 0.08);
    path.lineTo(size.width * 0.51, size.height * 0.25);
    path.cubicTo(
      size.width * 0.51, size.height * 0.32,
      size.width * 0.56, size.height * 0.37,
      size.width * 0.64, size.height * 0.37,
    );
    path.lineTo(size.width * 0.81, size.height * 0.37);
    path.lineTo(size.width * 0.81, size.height * 0.68);
    path.cubicTo(
      size.width * 0.81, size.height * 0.83,
      size.width * 0.69, size.height * 0.92,
      size.width * 0.55, size.height * 0.92,
    );
    path.lineTo(size.width * 0.25, size.height * 0.92);
    path.cubicTo(
      size.width * 0.18, size.height * 0.92,
      size.width * 0.13, size.height * 0.87,
      size.width * 0.13, size.height * 0.80,
    );
    path.close();

    canvas.drawPath(path, paint);

    // Folded corner of document
    final corner = Path();
    corner.moveTo(size.width * 0.66, size.height * 0.09);
    corner.cubicTo(
      size.width * 0.61, size.height * 0.075,
      size.width * 0.61, size.height * 0.09,
      size.width * 0.61, size.height * 0.11,
    );
    corner.lineTo(size.width * 0.61, size.height * 0.26);
    corner.cubicTo(
      size.width * 0.61, size.height * 0.32,
      size.width * 0.66, size.height * 0.37,
      size.width * 0.73, size.height * 0.37,
    );
    corner.lineTo(size.width * 0.87, size.height * 0.37);
    corner.cubicTo(
      size.width * 0.89, size.height * 0.37,
      size.width * 0.91, size.height * 0.34,
      size.width * 0.89, size.height * 0.32,
    );
    corner.close();

    canvas.drawPath(corner, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HeartIcon extends StatelessWidget {
  final double size;
  final Color color;

  const HeartIcon({
    super.key,
    this.size = 16,
    this.color = AppColors.secondaryOrange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: HeartIconPainter(color),
      ),
    );
  }
}

class HeartIconPainter extends CustomPainter {
  final Color color;

  HeartIconPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    // Heart shape
    path.moveTo(size.width * 0.5, size.height * 0.8);
    path.cubicTo(
      size.width * 0.35, size.height * 0.65,
      size.width * 0.2, size.height * 0.5,
      size.width * 0.2, size.height * 0.35,
    );
    path.cubicTo(
      size.width * 0.2, size.height * 0.2,
      size.width * 0.3, size.height * 0.1,
      size.width * 0.5, size.height * 0.3,
    );
    path.cubicTo(
      size.width * 0.7, size.height * 0.1,
      size.width * 0.8, size.height * 0.2,
      size.width * 0.8, size.height * 0.35,
    );
    path.cubicTo(
      size.width * 0.8, size.height * 0.5,
      size.width * 0.65, size.height * 0.65,
      size.width * 0.5, size.height * 0.8,
    );
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
