import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Заголовок дня для группировки: «Сегодня» / «Вчера» / дата.
String formatDayHeader(DateTime date, {String locale = 'ru'}) {
  final DateTime today = DateUtils.dateOnly(DateTime.now());
  final DateTime day = DateUtils.dateOnly(date);
  final DateTime yesterday = today.subtract(const Duration(days: 1));
  if (day == today) return 'Сегодня';
  if (day == yesterday) return 'Вчера';
  return DateFormat.yMMMMd(locale).format(date);
}
