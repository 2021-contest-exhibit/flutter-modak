import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  final PageController pageController = PageController(initialPage: 0);
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: BottomNavigationWidget(pageController: pageController,),
      ),
    ),
  ));
}

class BottomNavigationWidget extends StatefulWidget {
  final PageController pageController;

   BottomNavigationWidget({required this.pageController});

  @override
  BottomNavigationWidgetState createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {

  void moveToPage(int index) {
    setState(() {
      widget.pageController.animateToPage(index, duration: Duration(milliseconds: 150), curve: Curves.fastOutSlowIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    widget.pageController.addListener(() {
      setState(() {
      });
    });
    return Container(
      width: size.width,
      height: 80,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, 100),
            painter: _BNCustomPainter((widget.pageController.page??0).round()),
          ),

          Positioned(
            bottom: 0.0,
            child: Container(
              width: size.width,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    icon: Icon(
                      (widget.pageController.page??0).round() == 0
                          ? Icons.home
                          : Icons.home_outlined,
                      color: Colors.black
                    ),
                    iconSize: (widget.pageController.page??0).round() == 0 ? 36 : 32,
                    onPressed: () {
                      moveToPage(0);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      (widget.pageController.page??0).round() == 1
                          ? Icons.people
                          : Icons.people_outline,
                      color: Colors.black,
                    ),
                    iconSize: (widget.pageController.page??0).round() == 1 ? 36 : 32,
                    onPressed: () {
                      moveToPage(1);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      (widget.pageController.page??0).round() == 2
                          ? Icons.search
                          : Icons.search_outlined,
                      color: Colors.black,
                    ),
                    iconSize: (widget.pageController.page??0).round() == 2 ? 36 : 32,
                    onPressed: () {
                      moveToPage(2);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      (widget.pageController.page??0).round() == 3
                          ? Icons.more_horiz
                          : Icons.more_horiz_outlined,
                      color: Colors.black,
                    ),
                    iconSize: (widget.pageController.page??0).round() == 3 ? 36 : 32,
                    alignment: Alignment.center,
                    onPressed: () {
                      moveToPage(3);
                    },
                  ),
                ],
              ),
            ),
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
    canvas.drawShadow(path_0, Colors.black, 100.0, false);
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
    canvas.drawShadow(path_0, Colors.grey.withAlpha(50), 2.0, false);

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
