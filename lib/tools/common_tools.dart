// function used for firestore / js_firestore to set the last document in case we're paginating
typedef SetLastDoc(Object value);

// Data has no real restrictions to be read unless it is specified with ReadCondition = AsSpecifiedInPrivilegeLevelRequired
// and the privilegeLevelRequired is also specified and higher than the member's app privilegeLevel as specified in App/Access/{user}/privilegeLevel
// Even when privilegeLevelRequired is set to 0, it is a privilege one needs to have. For example a member with pending membership
// has privilegeLevel -1, a member that has been cancelled has privilegeLevel -2, so they won't have access to privilegeLevelRequired 0 documents

enum ReadCondition {
  NoRestriction, MustNotBeLoggedIn, PackageDecides, AsSpecifiedInPrivilegeLevelRequired
}

ReadCondition toReadCondition(int index) {
  if (index == null) return ReadCondition.NoRestriction;
  switch (index) {
    case 0: return ReadCondition.NoRestriction;
    case 1: return ReadCondition.MustNotBeLoggedIn;
    case 2: return ReadCondition.PackageDecides;
    case 3: return ReadCondition.AsSpecifiedInPrivilegeLevelRequired;
  }
}
