import 'package:flutter/cupertino.dart';


Widget messageBubble({required String message, required Color color, required Color textColor , EdgeInsetsGeometry? margin}) => Container(
  padding: const EdgeInsets.all(10),
  margin: margin,
  decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(15),
  ),
  child: Text(
    message,
    style: TextStyle(
      color: textColor,
      fontFamily: 'Poppins',
      fontSize: 15,
      fontWeight: FontWeight.w500
    ),
  ),
);
