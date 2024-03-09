import 'package:flutter/material.dart';
import '../../Constants/Colors.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({Key? key}) : super(key: key);

  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..addListener(() {
      setState(() {});
    });

    _controller2 = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..addListener(() {
      setState(() {});
    });

    _controller3 = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..addListener(() {
      setState(() {});
    });

    Future.delayed(Duration(seconds: 0), () {
      print('Controller 1 forward called');
      _controller1.forward(from: 0.1);
    });
    Future.delayed(Duration(seconds: 1), () {
      print('Controller 2 forward called');
      _controller2.forward(from: 0.1);
    });
    Future.delayed(Duration(seconds: 2), () {
      print('Controller 3 forward called');
      _controller3.forward(from: 0.1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OverflowBox(
        maxWidth: double.infinity,
        maxHeight: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _buildCircle(640 * _controller1.value, primary1),
            _buildCircle(520 * _controller2.value, primary2),
            _buildCircle(400 * _controller3.value, primary3),
          ],
        ),
      ),
    );
  }

  Widget _buildCircle(double radius, Color color) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }
}