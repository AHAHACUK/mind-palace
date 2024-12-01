class Nullable<T> {
  final T? value;

  Nullable(this.value);
}

extension NullableExtension<T> on T? {
  Nullable<T> get nullable {
    return Nullable(this);
  }
}
