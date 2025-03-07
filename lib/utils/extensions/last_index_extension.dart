import 'package:flutter/widgets.dart';

extension ListExtensions<T> on List<T> {
  int get lastIndex => isNotEmpty ? length - 1 : -1;
}
