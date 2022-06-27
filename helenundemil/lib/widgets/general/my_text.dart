import 'package:flutter/material.dart';
import 'package:helenundemil/utils/styling.dart';

class MyText extends StatefulWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final bool? bold;

  const MyText({
    Key? key,
    required this.text,
    this.fontSize = 24,
    this.color = AppColors.Primary,
    this.bold,
  }) : super(key: key);

  @override
  _MyTextState createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  @override
  Widget build(BuildContext context) {
    var isBold = false;
    if (widget.bold != null) {
      isBold = widget.bold!;
    }
    return Text(
      widget.text,
      style: TextStyle(
          color: widget.color,
          fontSize: widget.fontSize,
          fontFamily: 'CrimsonPro',
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
    );
  }
}
