bool isDouble(String? s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

bool isInt(String? s) {
  if (s == null) {
    return false;
  }
  return int.tryParse(s) != null;
}
