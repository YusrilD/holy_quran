import 'package:intl/intl.dart';

extension DateTimeIndoFormat on DateTime {

  /// Format: Senin, 01 Januari 2023
  String get fullDateIndo {
    return DateFormat("EEEE, dd MMMM yyyy", "id_ID").format(this);
  }

  /// Format: 01 Januari 2023
  String get dateIndo {
    return DateFormat("dd MMMM yyyy", "id_ID").format(this);
  }

  /// Format: 01 Jan 2023
  String get shortDateIndo {
    return DateFormat("dd MMM yyyy", "id_ID").format(this);
  }

  /// Format: Sen, 01 Jan 2023
  String get dayShortDateIndo {
    return DateFormat("EEE, dd MMM yyyy", "id_ID").format(this);
  }

  /// Format: Senin, 01 Januari
  String get dayDateMonthIndo {
    return DateFormat("EEEE, dd MMMM", "id_ID").format(this);
  }

  /// Format: 01/01/2023
  String get numericDateIndo {
    return DateFormat("dd/MM/yyyy").format(this);
  }

  String get toDashFormat {
    return DateFormat("yyyy-MM-dd").format(this);
  }

  /// Format: 01 Jan, 13:45
  String get shortDateTimeIndo {
    return DateFormat("dd MMM, HH:mm", "id_ID").format(this);
  }

  /// Format: 13:45 (24-hour format)
  String get time24HourIndo {
    return DateFormat("HH:mm").format(this);
  }

  /// Format: 01 Januari 2023, 13:45 (full date with time)
  String get fullDateTimeIndo {
    return DateFormat("dd MMMM yyyy, HH:mm", "id_ID").format(this);
  }

  String get toIndonesianTimeFormat {
    return "${this.hour.toString().padLeft(2, '0')}:${this.minute.toString().padLeft(2, '0')}";
  }
}
