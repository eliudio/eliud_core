import 'dart:typed_data';
import 'dart:html' as html;

class OtherHelpers {
  static String getUrlFromUint8List(Uint8List bytes) {
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    return url;
  }
}