import 'parsed_entry.dart';

/// Распознаёт операции из извлечённого текста выписки.
abstract interface class StatementParser {
  List<ParsedEntry> parse(String text);
}
