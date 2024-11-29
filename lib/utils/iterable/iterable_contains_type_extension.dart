extension IterableContainsTypeExtension<T> on Iterable<T> {
  bool containsType<K extends T>() {
    final iterator = this.iterator;
    while (iterator.moveNext()) {
      if (iterator.current is K) return true;
    }
    return false;
  }
}
