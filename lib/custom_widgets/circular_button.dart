import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final double? fontSize;
  final IconData icon;
  final String? text;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final Function()? onTap;

  const CircularButton({
    Key? key,
    required this.iconColor,
    required this.backgroundColor,
    required this.icon,
    this.text,
    this.onTap,
    this.fontSize = 20,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              size: 35,
              color: iconColor,
            ),
          ),
          text != null
              ? Text(
                  text!,
                  style: TextStyle(
                    fontSize: 12,
                    color: textColor,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
