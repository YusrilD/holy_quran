import 'package:intl/intl.dart';

extension StringToFormattedDate on String {
  DateTime? get _parsedDate {
    try {
      return DateTime.parse(this);
    } catch (e) {
      return null;
    }
  }

  /// Format: Senin, 01 Januari 2023
  String get fullDateIndo {
    final date = _parsedDate;
    return date != null
        ? DateFormat("EEEE, dd MMMM yyyy", "id_ID").format(date)
        : "Invalid date";
  }

  /// Format: 01 Januari 2023
  String get dateIndo {
    final date = _parsedDate;
    return date != null
        ? DateFormat("dd MMMM yyyy", "id_ID").format(date)
        : "Invalid date";
  }

  /// Format: 01 Jan 2023
  String get shortDateIndo {
    final date = _parsedDate;
    return date != null
        ? DateFormat("dd MMM yyyy", "id_ID").format(date)
        : "Invalid date";
  }

  /// Format: Sen, 01 Jan 2023
  String get dayShortDateIndo {
    final date = _parsedDate;
    return date != null
        ? DateFormat("EEE, dd MMM yyyy", "id_ID").format(date)
        : "Invalid date";
  }

  /// Format: Senin, 01 Januari
  String get dayDateMonthIndo {
    final date = _parsedDate;
    return date != null
        ? DateFormat("EEEE, dd MMMM", "id_ID").format(date)
        : "Invalid date";
  }

  /// Format: Senin
  String get dayNameIndo {
    final date = _parsedDate;
    return date != null
        ? DateFormat("EEEE", "id_ID").format(date)
        : "Invalid date";
  }

  String get monthNameIndo {
    final date = _parsedDate;
    return date != null
        ? DateFormat("MMMM", "id_ID").format(date)
        : "Invalid date";
  }

  String get yearIndo {
    final date = _parsedDate;
    return date != null
        ? DateFormat("yyyy").format(date)
        : "Invalid date";
  }

  /// Format: 01/01/2023
  String get numericDateIndo {
    final date = _parsedDate;
    return date != null
        ? DateFormat("dd/MM/yyyy").format(date)
        : "Invalid date";
  }

  /// Format: 01 Jan, 13:45
  String get shortDateTimeIndo {
    final date = _parsedDate;
    return date != null
        ? DateFormat("dd MMM, HH:mm", "id_ID").format(date)
        : "Invalid date";
  }

  /// Format: 13:45 (24-hour format)
  String get time24HourIndo {
    final date = _parsedDate;
    return date != null
        ? DateFormat("HH:mm").format(date)
        : "Invalid date";
  }

  /// Format: 01 Januari 2023, 13:45 (full date with time)
  String get fullDateTimeIndo {
    final date = _parsedDate;
    return date != null
        ? DateFormat("dd MMMM yyyy, HH:mm", "id_ID").format(date)
        : "Invalid date";
  }

  /// Converts a string date to "YYYY-MM-DD" format
  String get toDashDate {
    final date = _parsedDate;
    print("checkue: $date");
    return date != null ? DateFormat("yyyy-MM-dd").format(date) : "Invalid date";
  }

  String get toDateOnly {
    final date = _parsedDate;
    return date != null ? DateFormat("dd").format(date) : "Invalid date";
  }

  String get toDashFormatted {
    // Parse the input date string using the 'dd/MM/yy' format
    final inputFormat = DateFormat('dd/MM/yy');
    final date = inputFormat.parse(this);

    // Format the date to 'yyyy-MM-dd' format
    final outputFormat = DateFormat('yyyy-MM-dd');
    final formattedDate = outputFormat.format(date);

    return formattedDate;
  }

  String get toDashFormattedDMY {
    // Parse the input date string using the 'dd/MM/yy' format
    final inputFormat = DateFormat('dd/MM/yyyy');
    final date = inputFormat.parse(this);

    // Format the date to 'yyyy-MM-dd' format
    final outputFormat = DateFormat('yyyy-MM-dd');
    final formattedDate = outputFormat.format(date);

    return formattedDate;
  }

  String get toIndonesianTime {
    try {
      // Parse the time assuming the format "HH:mm:ss.ffffff"
      final timeParts = split(':');
      if (timeParts.length >= 2) {
        return "${timeParts[0].padLeft(2, '0')}:${timeParts[1].padLeft(2, '0')}";
      }
    } catch (_) {
      // Handle cases where the string is not in the expected format
    }
    // Return an empty string or a default fallback value
    return "";
  }

  String get toLocalTime {
    return this.substring(0, 5);
  }
}
