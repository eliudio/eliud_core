// function used for firestore / js_firestore to set the last document in case we're paginating
typedef SetLastDoc(Object value);

// Data has no real restrictions to be read unless it is specified with ReadCondition = MemberOrPrivilegedMemberOnly

enum ReadCondition {
  NoRestriction,
  MustNotBeLoggedIn,
  PackageDecides,
  MemberOrPrivilegedMemberOnly
}

ReadCondition toReadCondition(int index) {
  if (index == null) return ReadCondition.NoRestriction;
  switch (index) {
    case 0:
      return ReadCondition.NoRestriction;
    case 1:
      return ReadCondition.MustNotBeLoggedIn;
    case 2:
      return ReadCondition.PackageDecides;
    case 3:
      return ReadCondition.MemberOrPrivilegedMemberOnly;
  }
}

// When readCondition is set to MemberOrPrivilegedMemberOnly, then privilegeLevelRequired is compared against the priveligeLevel of the member (in App/Access/{user id}/privilegeLevel)
// privilegeLevels can be:

const int BLOCKED_MEMBERSHIP = -1;
const int NO_PRIVILEGE = 0; // equals subscription
const int LEVEL1_PRIVILEGE = 1; // equals membership
const int LEVEL2_PRIVILEGE = 2; // equals privileged membership
const int OWNER_PRIVILEGES = 3;

String privilegeLevelToString(int status) {
  switch (status) {
    case BLOCKED_MEMBERSHIP:
      return "banned";
    case NO_PRIVILEGE:
      return "subscribed";
    case LEVEL1_PRIVILEGE:
      return "member";
    case LEVEL2_PRIVILEGE:
      return "vip member";
    case OWNER_PRIVILEGES:
      return "owner";
  }
  return null;
}
