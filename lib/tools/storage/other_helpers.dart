//import 'dart:html' as html;
import 'package:universal_html/html.dart' as html;
import 'dart:typed_data';

class OtherHelpers {
  static String getUrlFromUint8List(Uint8List bytes) {
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    return url;
  }
}
