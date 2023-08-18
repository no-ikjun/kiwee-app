import 'package:flutter/material.dart';

Widget customButton({
  required VoidCallback onPressed,
  required String label,
  required double width,
  required double height,
  Color fontColor = Colors.black,
  double fontSize = 14,
  String fontFamily = "AppleSDGothicNeo400",
  FontWeight fontWeight = FontWeight.w700,
  Color backgroundColor = Colors.white,
  Color borderColor = Colors.black,
  double borderWidth = 1.0,
  double borderRadius = 8.0,
  bool removeTopRadius = false,
  bool underLine = false,
}) {
  return OutlinedButton(
    onPressed: onPressed,
    style: OutlinedButton.styleFrom(
      splashFactory: NoSplash.splashFactory,
      padding: const EdgeInsets.all(0),
      fixedSize: Size(width, height),
      backgroundColor: backgroundColor,
      side: BorderSide(color: borderColor, width: borderWidth),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(removeTopRadius ? 0 : borderRadius),
          bottom: Radius.circular(borderRadius),
        ),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
            color: fontColor,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
            decoration: underLine ? TextDecoration.underline : null,
          ),
        ),
      ],
    ),
  );
}
