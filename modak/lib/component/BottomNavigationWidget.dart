import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: BottomNavigationWidget(),
      ),
    ),
  ));
}

class BottomNavigationWidget extends StatefulWidget {

  @override
  BottomNavigationWidgetState createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 80,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, 80),
            painter: _BNCustomPainter(3),
          )
        ],
      ),
    );
  }
}

class _BNCustomPainter extends CustomPainter {
  final int _index;

  _BNCustomPainter(this._index);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path_0 = Path();
    path_0.moveTo(0,size.height);
    path_0.lineTo(0,size.height*0.2500000);
    path_0.quadraticBezierTo(0 + (size.width * 0.25 * _index),size.height*0.2500000,0 + (size.width * 0.25 * _index),size.height*0.2500000);
    path_0.quadraticBezierTo(size.width*0.0625 + (size.width * 0.25 * _index),0,size.width*0.1250000 + (size.width * 0.25 * _index),0);
    path_0.quadraticBezierTo(size.width*0.1875 + (size.width * 0.25 * _index),0, size.width*0.2500000 + (size.width * 0.25 * _index),size.height*0.2500000);
    path_0.quadraticBezierTo(size.width*0.4375000 + (size.width * 0.25 * _index),size.height*0.2500000,size.width + (size.width * 0.25 * _index),size.height*0.2500000);
    path_0.lineTo(size.width,size.height);
    path_0.lineTo(0,size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint_0 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;


    Path path_0 = Path();
    path_0.moveTo(0,size.height);
    path_0.lineTo(0,size.height*0.2500000);
    path_0.quadraticBezierTo(0 + (size.width * 0.25 * 2),size.height*0.2500000,0 + (size.width * 0.25 * 2),size.height*0.2500000);
    path_0.quadraticBezierTo(size.width*0.0625 + (size.width * 0.25 * 2),0,size.width*0.1250000 + (size.width * 0.25 * 2),0);
    path_0.quadraticBezierTo(size.width*0.1875 + (size.width * 0.25 * 2),0, size.width*0.2500000 + (size.width * 0.25 * 2),size.height*0.2500000);
    path_0.quadraticBezierTo(size.width*0.4375000 + (size.width * 0.25 * 2),size.height*0.2500000,size.width + (size.width * 0.25 * 2),size.height*0.2500000);
    path_0.lineTo(size.width,size.height);
    path_0.lineTo(0,size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
