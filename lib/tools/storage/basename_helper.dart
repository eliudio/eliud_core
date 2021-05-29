
import 'package:path/path.dart';

class BaseNameHelper {
  static String baseName(String filePath) {
    return context.basename(filePath);
  }

  static String thumbnailBaseName(String filePath) {
    return context.basenameWithoutExtension(filePath) +
        '.thumbnail.png';
  }

  static String baseNameExt(String filePath, String ext) {
    return context.basenameWithoutExtension(filePath) + '.' + ext;
  }

  static String baseNameWithPageExt(String filePath, int page, String ext) {
    return context.basenameWithoutExtension(filePath) +
        '.$page.' +
        ext;
  }

  static String thumbnailBaseNameWithPage(String filePath, int page) {
    return context.basenameWithoutExtension(filePath) +
        '.$page.thumbnail.png';
  }
}
