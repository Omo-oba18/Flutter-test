import 'package:flutter/material.dart';
import 'package:test_project/extensions/context_extenstions.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Gradient gradient;

  const GradientButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 0.095 * context.mqSize.width,
      ),
      constraints: BoxConstraints.expand(
        height: 0.0684 * context.mqSize.height,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(30),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.0453 * context.mqSize.width,
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 0.0296 * context.mqSize.height,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 0.0251 * context.mqSize.height,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
