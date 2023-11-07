import 'dart:math';

typedef IsEqual<T> = bool Function(T? value1, T? value2);

List<T> merge<T>(List<T> list1, List<T> list2) {
  List<T> output = [];
  var minLength = min(list1.length, list2.length);
  var maxLength = max(list1.length, list2.length);

  for (var i = 0; i < minLength; i++) {
    output.add(list1[i]);
    output.add(list2[i]);
  }

  List<T> longer = list1.length > list2.length ? list1 : list2;

  for (var i = minLength; i < maxLength; i++) {
    output.add(longer[i]);
  }

  return output;
}

List<T> removeDuplicates<T>(List<T> list, IsEqual isEqual) {
  List<T> output = [];
  for (var i = 0; i < list.length; i++) {
    bool found = false;
    for (var j = 0; j < output.length; j++) {
      if (isEqual(list[i], output[j])) {
        found = true;
      }
    }
    if (!found) {
      output.add(list[i]);
    }
  }

  return output;
}

List<T> mergeUnique<T>(List<T> list1, List<T> list2, IsEqual isEqual) =>
    removeDuplicates(merge(list1, list2), isEqual);
