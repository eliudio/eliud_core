import 'package:path/path.dart';

class BaseNameHelper {
  static String baseName(String memberMediumDocumentID, String filePath) {
    return '$memberMediumDocumentID.${context.basename(filePath)}';
  }

  static String thumbnailBaseName(
      String memberMediumDocumentID, String filePath) {
    return '$memberMediumDocumentID.${context.basenameWithoutExtension(filePath)}.thumbnail.png';
  }

  static String baseNameExt(
      String memberMediumDocumentID, String filePath, String ext) {
    return '$memberMediumDocumentID.${context.basenameWithoutExtension(filePath)}.$ext';
  }

  static String baseNameWithPageExt(
      String memberMediumDocumentID, String filePath, int page, String ext) {
    return '$memberMediumDocumentID.${context.basenameWithoutExtension(filePath)}.$page.$ext';
  }

  static String thumbnailBaseNameWithPage(
      String memberMediumDocumentID, String filePath, int page) {
    return '$memberMediumDocumentID.${context.basenameWithoutExtension(filePath)}.$page.thumbnail.png';
  }
}
