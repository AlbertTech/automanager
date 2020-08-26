import 'package:flutter/material.dart';

@immutable
class ShadowClipper extends StatelessWidget {
  final Shadow myShadow;
  final CustomClipper<Path> myClipper;
  final Widget myChild;

  ShadowClipper({
    @required this.myShadow,
    @required this.myClipper,
    @required this.myChild,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      key: UniqueKey(),
      painter: _ClipShadowShadowPainter(
        clipper: this.myClipper,
        shadow: this.myShadow,
      ),
      child: ClipPath(child: myChild, clipper: this.myClipper),
    );
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({@required this.shadow, @required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ClipPathWithShadow {
  final CustomClipper myClipper;
  final Color myColor;
  final double blurValue;
  final double xOffSetValue;
  final double yOffSetValue;

  ClipPathWithShadow(this.myClipper, this.myColor, this.blurValue,
      this.xOffSetValue, this.yOffSetValue);

  Widget getWidget() {
    return ShadowClipper(
      myShadow: Shadow(
          color: Colors.black.withOpacity(.225),
          blurRadius: blurValue,
          offset: Offset(xOffSetValue, yOffSetValue)),
      myClipper: myClipper,
      myChild: Container(
        decoration: BoxDecoration(
          color: myColor,
        ),
      ),
    );
  }
}
