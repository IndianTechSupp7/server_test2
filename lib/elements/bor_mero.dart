import 'dart:math';

import 'package:flutter/material.dart';
import 'package:server_test2/models/container.dart';

class MyCustomPainter extends CustomPainter {
  double fill;
  static double startAngle = 0.785;
  static double endAngle = -4.71;
  BuildContext context;
  MyCustomPainter({required this.fill, required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    // Create a paint object
    final paint = Paint()
      ..color = Theme.of(context).colorScheme.surfaceContainer;

    paint.style = PaintingStyle.fill;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2 + 15, paint);

    paint.color = Color.lerp(Color.fromARGB(255, 43, 70, 243),
        Color.fromARGB(255, 252, 51, 51), max(0.1, min(0.8, fill)))!;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 15;
    paint.strokeCap = StrokeCap.round;
    // Draw a rectangle
    canvas.drawArc(Rect.fromLTWH(0, 0, size.width, size.height), startAngle,
        endAngle * max(fill, 0.001), false, paint);

    // Change paint color

    // Draw a circle
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Return true if you want to repaint when properties change
  }
}

class BorWidget extends StatefulWidget {
  double fill = 0.0;
  BorContainer container;
  bool kelvin = false; // indicates that the data dispalys as kelvin or celsius 
  BorWidget({super.key, required this.container}) {
    fill = container.temp / (container.maxtemp - container.mintemp);
  }

  @override
  State<BorWidget> createState() => _BorWidgetState();
}

class _BorWidgetState extends State<BorWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            child: CustomPaint(
              painter: MyCustomPainter(fill: widget.fill, context: context),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${(widget.kelvin? widget.container.temp+274 : widget.container.temp).toString()}",
                        style: TextStyle(
                          fontSize: 36,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.kelvin?"K":"°C", style: TextStyle(fontSize: 16),),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.container.name,
                    style: TextStyle(
                        color: Color.lerp(
                            Color.lerp(
                                Color.fromARGB(255, 43, 70, 243),
                                Color.fromARGB(255, 252, 51, 51),
                                max(0.1, min(0.8, widget.fill))!),
                            Colors.white,
                            0.7),

// Add this variable at the top of your file
                        fontSize: 20),
                  )
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
