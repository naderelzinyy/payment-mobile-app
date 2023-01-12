import 'package:flutter/material.dart';
import 'package:payment_app/component/colors.dart';

class MainButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final Function()? onTap;
  final bool? isBorder;
  final String text;

  const MainButton({
    Key? key,
    this.backgroundColor,
    this.onTap,
    this.textColor,
    required this.text,
    this.isBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1.5,
              color: AppColor.selectColor,
            )),
        child: const Text(
          'Pay',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
