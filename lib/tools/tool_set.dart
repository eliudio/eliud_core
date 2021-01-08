import 'package:eliud_core/model/access_model.dart';

String process(String template, { Map<String, String> parameters }) {
  if (parameters != null) {
    String processed = template;
    parameters.forEach((key, value) {
      processed = processed.replaceAll(key, value);
    });
    return processed;
  } else {
    return template;
  }
}

String privilegeLevelToPrivilegeString(PrivilegeLevel privilegeLevel) {
  return privilegeLevelToPrivilegeStringInt(privilegeLevel.index);
}

String privilegeLevelToPrivilegeStringInt(int privilegeLevelInt) {
  switch (privilegeLevelInt) {
    case 0: return 'No privilege';
    case 1: return 'Level 1 privilege';
    case 2: return 'Level 2 privilege';
    case 3: return 'Ownership privilege level';
  }
}

String privilegeLevelToMemberRoleString(PrivilegeLevel privilegeLevel) {
  return privilegeLevelIntToMemberRoleString(privilegeLevel.index);
}

String privilegeLevelIntToMemberRoleString(int privilegeLevelInt) {
  switch (privilegeLevelInt) {
    case 0: return 'Unprivileged member';
    case 1: return 'Member with level 1 privileges';
    case 2: return 'Member with level 2 privileges';
    case 3: return 'Member with ownership privileges';
  }
}
