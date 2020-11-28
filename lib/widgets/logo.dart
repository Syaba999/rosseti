import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double width;

  const Logo({Key key, this.width = 300}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Image.asset("assets/images/logo.png"),
    );
  }
}
