class FileDetails {
  final String packageName;

  FileDetails(this.packageName);
}

class FeedFileDetails extends FileDetails {
  final List<String> readAccess;

  FeedFileDetails(this.readAccess) : super('read_access');
}

class CoreFileDetails extends FileDetails {
  final int privilegeRequired;

  CoreFileDetails(this.privilegeRequired) : super('priviledged');
}
