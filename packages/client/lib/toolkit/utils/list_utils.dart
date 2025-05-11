extension IterableExtension<T> on Iterable<T> {
  Iterable<T> separated(T separator) sync* {
    if (isEmpty) return;
    final iterator = this.iterator;
    iterator.moveNext();
    while (true) {
      yield iterator.current;
      final hasMore = iterator.moveNext();
      if (hasMore) {
        yield separator;
      } else {
        break;
      }
    }
  }

  List<T> separatedList(T separator) => separated(separator).toList();

  List<R> mapList<R>(R Function(T e) toElement) => map(toElement).toList();
}
