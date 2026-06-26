import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Заголовок дня для группировки: «Сегодня» / «Вчера» / дата.
String formatDayHeader(
  DateTime date, {
  required String today,
  required String yesterday,
  String locale = 'ru',
}) {
  final DateTime now = DateUtils.dateOnly(DateTime.now());
  final DateTime day = DateUtils.dateOnly(date);
  if (day == now) return today;
  if (day == now.subtract(const Duration(days: 1))) return yesterday;
  return formatFullDate(date, locale);
}

/// Полная дата с откатом на русскую локаль, если данных по локали нет.
String formatFullDate(DateTime date, String locale) {
  try {
    return DateFormat.yMMMMd(locale).format(date);
  } catch (_) {
    return DateFormat.yMMMMd('ru').format(date);
  }
}
