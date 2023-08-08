import 'package:intl/intl.dart';

extension DateExt on DateTime {
  String get timeOnly {
    return DateFormat('hh:mm').format(this);
  }
}
