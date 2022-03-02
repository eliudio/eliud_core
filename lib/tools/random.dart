import 'package:uuid/uuid.dart';

// The documentID of an embedded item needs to be unique.
// Which unique number is irrelevant, just unique
String newRandomKey() {
  final uuid = Uuid();
  return uuid.v4();
}
