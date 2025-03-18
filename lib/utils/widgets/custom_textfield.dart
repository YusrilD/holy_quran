import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../text_theme.dart';

class CustomTextField {
  static Widget normalTextFormField({
    required String label,
    required String hint,
    required TextEditingController controller,
    ValueChanged<String>? onChanged,
    TextStyle? labelStyle,
    TextInputType keyboardType = TextInputType.text,
    bool? enabled,
    bool autoFocus = false,
  }) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(-2, 2), // Slight shadow towards bottom left
            blurRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
        color: Colors.white, // Background color
      ),
      child: TextFormField(
        controller: controller,
        enabled: enabled ?? true,
        autofocus: autoFocus,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: labelStyle,
          hintText: hint,
          hintStyle: AppTextTheme.getTextTheme().bodySmall,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          border: InputBorder.none,
          // Removes all borders
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          suffixIcon: IconButton(
            icon: const DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: Icon(
                Icons.close_rounded,
                color: Colors.white,
                size: 18,
              ),
            ),
            onPressed: () {
              controller.clear();
              if (onChanged != null) onChanged('');
            },
          ),
        ),
        onChanged: onChanged,
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Tidak boleh kosong';
          }
          return null;
        },
      ),
    );
  }

  static Widget centerTextFormField({
    required String label,
    required String hint,
    required TextEditingController controller,
    ValueChanged<String>? onChanged,
    TextStyle? labelStyle,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(-2, 2), // Slight shadow towards bottom left
            blurRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
        color: Colors.white, // Background color
      ),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 4,
        // decoration: InputDecoration(
        //   labelText: label,
        //   labelStyle: labelStyle,
        //   hintText: hint,
        //   hintStyle: AppTextTheme.getTextTheme().bodySmall,
        //   // enabledBorder: OutlineInputBorder(
        //   //   borderRadius: BorderRadius.circular(12),
        //   //   borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
        //   // ),
        //   // focusedBorder: OutlineInputBorder(
        //   //   borderRadius: BorderRadius.circular(12),
        //   //   borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
        //   // ),
        //   // border: InputBorder.none,
        //   // Removes all borders
        //   contentPadding:
        //       const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        // ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: labelStyle,
          hintText: hint,
          hintStyle: AppTextTheme.getTextTheme().bodySmall,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          border: InputBorder.none,
          // Removes all borders
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field cannot be empty';
          }
          return null;
        },
      ),
    );
  }

  static Widget passwordTextFormField({
    required String label,
    required TextEditingController controller,
    String hint = '',
    ValueChanged<String>? onChanged,
    TextStyle? labelStyle,
  }) {
    // Use ValueNotifier to manage the visibility state
    final ValueNotifier<bool> _obscureTextNotifier = ValueNotifier<bool>(true);
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextNotifier,
      builder: (context, obscureText, child) {
        return DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(-2, 2), // Slight shadow towards bottom left
                blurRadius: 4,
              ),
            ],
            borderRadius: BorderRadius.circular(12),
            color: Colors.white, // Background color
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            // Toggles between visible and invisible
            decoration: InputDecoration(
              labelText: label,
              labelStyle: labelStyle,
              hintText: hint,
              hintStyle: AppTextTheme.getTextTheme()
                  .bodySmall!
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0.0),
              ),
              border: InputBorder.none,
              // Removes all borders
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  // Toggle password visibility
                  _obscureTextNotifier.value = !_obscureTextNotifier.value;
                },
              ),
            ),
            onChanged: onChanged,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field cannot be empty';
              }
              return null;
            },
          ),
        );
      },
    );
  }

  static Widget roundedTextField({
    required BuildContext context,
    String? hintText,
    TextEditingController? controller,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? prefixIcon,
    Widget? suffixIcon,
    Function(String)? onChanged,
    Color borderColor = Colors.white,
    double borderRadius = 15.0,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 1.5),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 2.0),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 1.5),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }

  static Widget flexibleTextFormField({
    required String label,
    required String hint,
    required TextEditingController controller,
    ValueChanged<String>? onChanged,
    TextStyle? labelStyle,
    int minLines = 1, // Minimum number of lines for initial height
  }) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(-2, 2), // Slight shadow towards bottom left
            blurRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
        color: Colors.white, // Background color
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: labelStyle,
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          border: InputBorder.none,
          // Removes all borders
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          suffixIcon: IconButton(
            icon: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade400,
              ),
              child: const Icon(
                Icons.close_rounded,
                color: Colors.white,
                size: 18,
              ),
            ),
            onPressed: () {
              controller.clear();
              if (onChanged != null) onChanged('');
            },
          ),
        ),
        onChanged: onChanged,
        minLines: minLines,
        // Start with a minimum height
        maxLines: null,
        // Allow the field to expand vertically
        keyboardType: TextInputType.multiline,
        // Enable multiline input
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label tidak boleh kosong';
          }
          return null;
        },
      ),
    );
  }

  static Widget dateTextFormField({
    required String label,
    required String hint,
    required TextEditingController controller,
    ValueChanged<String>? onChanged,
    TextStyle? labelStyle,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: labelStyle,
        hintText: hint,
        border: const UnderlineInputBorder(),
        suffixIcon: IconButton(
          icon: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade400,
            ),
            child: const Icon(
              Icons.close_rounded,
              color: Colors.white,
              size: 18,
            ),
          ),
          onPressed: () {
            controller.clear();
            if (onChanged != null) onChanged('');
          },
        ),
      ),
      inputFormatters: [
        // Formatter for date input (DD/MM/YYYY)
        LengthLimitingTextInputFormatter(
            10), // Limit to 10 characters (DD/MM/YYYY)
        FilteringTextInputFormatter.allow(
            RegExp(r'[0-9/]')), // Allow only digits and slashes
      ],
      onChanged: (text) {
        String formattedText = _formatDateInput(text);
        controller.value = TextEditingValue(
          text: formattedText,
          selection: TextSelection.collapsed(offset: formattedText.length),
        );
        if (onChanged != null) {
          onChanged(formattedText);
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field cannot be empty';
        }
        return null;
      },
    );
  }

  // Helper function to format date input as DD/MM/YYYY
  static String _formatDateInput(String text) {
    // Remove any non-numeric characters
    text = text.replaceAll(RegExp(r'[^0-9]'), '');

    // Format the input as DD/MM/YYYY
    if (text.length < 2) {
      return text;
    } else if (text.length < 4) {
      return '${text.substring(0, 2)}/${text.substring(2)}';
    } else if (text.length < 6) {
      return '${text.substring(0, 2)}/${text.substring(2, 4)}/${text.substring(4)}';
    } else {
      return '${text.substring(0, 2)}/${text.substring(2, 4)}/${text.substring(4, 8)}';
    }
  }
}
