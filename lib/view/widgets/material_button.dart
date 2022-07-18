import 'package:flutter/material.dart';

class MaterialOutlinedButton extends StatelessWidget {
  final Color backgroundColor;
  final Color outlineColor;
  final String buttonText;
  final TextStyle buttonTextStyle;
  final Function()? onPressed;

  const MaterialOutlinedButton(
      {required this.backgroundColor,
      required this.outlineColor,
      required this.buttonText,
      required this.buttonTextStyle,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    try {
      return Flexible(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                Size(500, 50),
              ),
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              side: MaterialStateProperty.all(
                BorderSide(
                    color: outlineColor, width: 1.0, style: BorderStyle.solid),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            child: Text(
              buttonText,
              style: buttonTextStyle,
            ),
          ),
        ),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

class MaterialSolidButton extends StatelessWidget {
  final Color backgroundColor;
  final String buttonText;
  final TextStyle buttonTextStyle;
  final Function()? onPressed;

  MaterialSolidButton(
      {required this.backgroundColor,
      required this.buttonText,
      required this.buttonTextStyle,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    try {
      return Flexible(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                Size(500, 50),
              ),
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            child: Text(
              buttonText,
              style: buttonTextStyle,
            ),
          ),
        ),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
