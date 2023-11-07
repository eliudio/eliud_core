extension ListReplace<T> on List<T> {
  void replace(int index1, T newItem) {
    var length = this.length;
    RangeError.checkValidIndex(index1, this, "index1", length);
    this[index1] = newItem;
  }
}
