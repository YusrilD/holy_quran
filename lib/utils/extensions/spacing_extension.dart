import 'package:flutter/widgets.dart';

extension Spacing on double {
  /// Creates a vertical space using [SizedBox].
  Widget get verticalSpace => SizedBox(height: this);

  /// Creates a horizontal space using [SizedBox].
  Widget get horizontalSpace => SizedBox(width: this);

  /// Creates vertical padding.
  EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: this);

  /// Creates horizontal padding.
  EdgeInsets get horizontalPadding => EdgeInsets.symmetric(horizontal: this);
}
