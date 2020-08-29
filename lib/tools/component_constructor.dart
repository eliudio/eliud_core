import 'package:flutter/cupertino.dart';

abstract class ComponentConstructor {
  Widget createNew({String id, Map<String, String> parameters});
}
