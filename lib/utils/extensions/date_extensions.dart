import 'package:intl/intl.dart';

extension DateExtensions on String {
  DateTime get parseStringToDate {
    return DateFormat('yyyy-MM-dd hh:mm:ss').parse(this);
  }
}

extension ParseTimeExtensions on String {
  String get parseToTime {
    final val = DateFormat('yyyy-MM-dd hh:mm:ss').parse(this);
    return DateFormat('h:mm').format(val);
  }
}

extension ParseTimeFormatExtensions on String {
  String get parseToTimeFormat {
    final val = DateFormat('yyyy-MM-dd hh:mm:ss').parse(this);
    return DateFormat('a').format(val);
  }
}


extension ParseDateExtensions on DateTime {
  String get convertToDate {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}


extension ParseDateTimeExtensions on String {
  String get customeDateTime {
    final date = DateFormat('yyyy-MM-dd').parse(this);
    return DateFormat('EEEE, dd MMMM, yyyy', 'ms').format(date);
  }
}
