// function used for firestore / js_firestore to set the last document in case we're paginating
typedef SetLastDoc(Object value);

// Data has no real restrictions to be read unless it is specified with ReadCondition = MemberOrPrivilegedMemberOnly

enum ReadCondition {
  NoRestriction, MustNotBeLoggedIn, PackageDecides, MemberOrPrivilegedMemberOnly
}

ReadCondition toReadCondition(int index) {
  if (index == null) return ReadCondition.NoRestriction;
  switch (index) {
    case 0: return ReadCondition.NoRestriction;
    case 1: return ReadCondition.MustNotBeLoggedIn;
    case 2: return ReadCondition.PackageDecides;
    case 3: return ReadCondition.MemberOrPrivilegedMemberOnly;
  }
}

// When readCondition is set to MemberOrPrivilegedMemberOnly, then privilegeLevelRequired is compared against the priveligeLevel of the member (in App/Access/{user id}/privilegeLevel)
// privilegeLevels can be:

int PENDING_MEMBERSHIP = -1;
int BLOCKED_MEMBERSHIP = -2;
int NO_PRIVILEGE = 0;     // equals subscription
int LEVEL1_PRIVILEGE = 1; // equals membership
int LEVEL2_PRIVILEGE = 2; // equals privileged membership
int OWNER_PRIVILEGES = 3;
