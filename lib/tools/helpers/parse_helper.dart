double double_parse(String value) {
  try {
    return double.parse(value);
  } catch (_) {
    return 0.0;
  }
}

int int_parse(String value) {
  try {
    return int.parse(value);
  } catch (_) {
    return 0;
  }
}

