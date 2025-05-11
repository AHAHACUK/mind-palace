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
}

extension IterableOfIterablesExtension<T> on Iterable<Iterable<T>> {
  Iterable<T> flatten() sync* {
    final iterator = this.iterator;
    while (iterator.moveNext()) {
      final item = iterator.current;
      for (final item in item) {
        yield item;
      }
    }
  }
}
