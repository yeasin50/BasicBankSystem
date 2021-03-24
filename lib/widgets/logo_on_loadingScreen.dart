import 'package:flutter/material.dart';

class LogoOnLoading extends StatelessWidget {
  final String imagePath;
  final double radius;
  final Color bgColor;

  LogoOnLoading({
    Key? key,
    required this.imagePath,
    required this.radius,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.8),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: bgColor,
            spreadRadius: 10,
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          // data.currentUser.imagePath,
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
