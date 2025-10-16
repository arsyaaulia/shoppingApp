import 'package:flutter/material.dart';
import 'package:shrine/colors.dart';

class AboutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Grafix merupakan Marketplace yang menawarkan\n'
          'jasa berbagai kebutuhan desain visual.\n\n'
          'Jasa desain yang ditawarkan mulai dari\n'
          'desain kebutuhan pribadi, kebutuhan sosmed,\n'
          'hingga kebutuhan event.\n',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: kShrineBlue900
          ),
        ),
      ),
    );
  }
}
