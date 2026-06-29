import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

/// Извлекает текст из PDF-выписки.
@lazySingleton
class StatementTextExtractor {
  String extractFromPdf(Uint8List bytes) {
    final PdfDocument document = PdfDocument(inputBytes: bytes);
    try {
      return PdfTextExtractor(document).extractText();
    } finally {
      document.dispose();
    }
  }
}
