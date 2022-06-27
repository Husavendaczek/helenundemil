import 'package:flutter/material.dart';
import 'package:helenundemil/utils/styling.dart';

class MyIcon extends StatefulWidget {
  final IconData iconData;
  final Color color;

  const MyIcon(
      {Key? key, required this.iconData, this.color = AppColors.Accent})
      : super(key: key);

  @override
  _MyIconState createState() => _MyIconState();
}

class _MyIconState extends State<MyIcon> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      widget.iconData,
      color: widget.color,
    );
  }
}
