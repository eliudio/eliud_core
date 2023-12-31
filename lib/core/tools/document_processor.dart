import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core_helpers/etc/screen_size.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:flutter/widgets.dart';

abstract class Param {
  final int position;
  final String original;

  Param(this.position, this.original);

  String replaceParamInStringWithDouble(String toReplace, double value) {
    return replaceParamInStringWithString(toReplace, value.toString());
  }

  String replaceParamInStringWithString(String toReplace, String value) {
    var part1 = toReplace.substring(0, position);
    var part2 =
        toReplace.substring(original.length + position + 3, toReplace.length);
    return part1 + value + part2;
  }
}

class KeyValue extends Param {
  final String key;
  final String value;

  KeyValue(super.position, super.original, this.key, this.value);

  @override
  String toString() {
    return 'KeyValue{key: $key, value: $value}';
  }

  int intValue(int defaultValue) {
    var intV = int.tryParse(value);
    if (intV == null) return defaultValue;
    return intV;
  }

  double doubleValue(double defaultValue) {
    var doubleV = double.tryParse(value);
    if (doubleV == null) return defaultValue;
    return doubleV;
  }
}

class SingleValue extends Param {
  SingleValue(super.position, super.original);

  @override
  String toString() {
    return 'SingleValue{value: $original}';
  }

  String value() => original;
}

class Tuple {
  final String key;
  final String value;

  Tuple(this.key, this.value);
}

class DocumentParameterProcessor {
  static String paramUserName = 'userName';
  static String paramUserGroup = 'userGroup';
  static String paramScreenWidthByFactor = 'screenWidthByFactor';
  static String paramScreenHeightByFactor = 'screenHeightByFactor';

  final BuildContext context;
  final AppModel app;

  DocumentParameterProcessor(this.context, this.app);

  Param? param(String parseMe) {
    var pos = parseMe.indexOf('\${');
    if (pos > 0) {
      var pos2 = parseMe.indexOf('}', pos);
      if (pos2 > 0) {
        var param = parseMe.substring(pos + 2, pos2);
        var pos3 = param.indexOf(':');
        if (pos3 > 0) {
          var key = param.substring(0, pos3);
          var value = param.substring(pos3 + 1, param.length);
          return KeyValue(pos, param, key, value);
        } else {
          return SingleValue(pos, param);
        }
      }
    }
    return null;
  }

  String? userName() {
    var member = AccessBloc.member(context);
    if (member == null) {
      return 'Not logged on';
    } else {
      return member.name;
    }
  }

  String userGroup() {
    var member = AccessBloc.member(context);
    if (AccessBloc.isOwner(context, app)) return 'Owner';
    if (member != null) {
      return 'Member';
    } else {
      return 'Guest';
    }
  }

  String otherKeyValue(String myString, KeyValue k) {
    return 'unknown ${k.key}';
  }

  String otherSingleValue(String myString, SingleValue p) {
    return p.replaceParamInStringWithString(myString, '?');
  }

  String otherParam(String myString, Param s) {
    return s.replaceParamInStringWithString(myString, '?');
  }

  String process(String documentContent) {
    var myString = documentContent;
    var p = param(myString);
    while (p != null) {
      if (p is KeyValue) {
        var k = p;
        if (k.key == paramScreenWidthByFactor) {
          var size = fullScreenWidth(context) * k.doubleValue(1);
          myString = k.replaceParamInStringWithDouble(myString, size);
        } else if (k.key == paramScreenHeightByFactor) {
          var size = fullScreenHeight(context) * k.doubleValue(1);
          myString = k.replaceParamInStringWithDouble(myString, size);
        } else {
          myString = otherKeyValue(myString, k);
        }
      } else if (p is SingleValue) {
        if (p.value() == paramUserName) {
          var usr = userName() ??
              '?'
                  '';
          myString = p.replaceParamInStringWithString(myString, usr);
        } else if (p.value() == paramUserGroup) {
          var usr = userGroup();
          myString = p.replaceParamInStringWithString(myString, usr);
        } else {
          myString = otherSingleValue(myString, p);
        }
      } else {
        myString = otherParam(myString, p);
      }
      p = param(myString);
    }
    return myString;
  }
}

String processDoc(BuildContext context, AppModel app, String original) {
  return DocumentParameterProcessor(context, app).process(original);
}
