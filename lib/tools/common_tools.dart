// function used for firestore / js_firestore to set the last document in case we're paginating
typedef SetLastDoc(Object value);

// Data has no real restrictions to be read unless it is specified with ReadCondition = MemberOrPrivilegedMemberOnly

// A page (or dialog, or menu item, or ...) has a ReadCondition. This can be one of the below

enum ReadCondition {
  NoRestriction,
  MustNotBeLoggedIn,
  PackageDecides,
  MemberOrPrivilegedMemberOnly
}

// If a ReadCondition is PackageDecides, then the field packageCondition is used as label to query the packages for the condition

// If a ReadCondition is MemberOrPrivilegedMemberOnly, than the privilegeLevelRequired is used to verify the condition and this is compared against the privilegeLevel specified for the member in app/access

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
const int NO_PRIVILEGE = 0;        // equals subscription
const int LEVEL1_PRIVILEGE = 1;    // equals membership
const int LEVEL2_PRIVILEGE = 2;    // equals privileged membership
const int OWNER_PRIVILEGES = 3;

// If a member is blocked (BLOCKED_MEMBERSHIP) then that member can still see the pages which have NoRestriction, MustNotBeLoggedIn pr PackageDecides

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
