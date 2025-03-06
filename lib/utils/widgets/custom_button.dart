import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../text_theme.dart';

class CustomButton extends StatelessWidget {
  final String text; // The button text
  final int color; // Background color of the button
  final Color textColor; // Color of the text
  final double width; // Width of the button
  final VoidCallback onPressed; // Callback for button press
  final FontWeight fontWeight;
  final double fontSize;
  final double btnHeight;
  final bool isLoading;

  const CustomButton({
    Key? key,
    required this.text,
    this.color = AppColor.primary,
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.w500,
    this.btnHeight = kToolbarHeight,
    required this.width,
    required this.onPressed,
    this.fontSize = 18,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: btnHeight,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed, // Disable button when loading
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: Color(color),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isLoading) // Show the loader if isLoading is true
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: textColor,
                    strokeWidth: 2,
                  ),
                ),
              ),
            Text(
              text,
              style: AppTextTheme.getTextTheme().bodyMedium!.copyWith(
                color: textColor,
                fontWeight: fontWeight,
                fontSize: fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
