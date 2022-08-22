extension ToInt on Object {
  int toInt() {
    final list = [
      if (this is Iterable<Object>)
        ...(List.of(this as Iterable<Object>))
      else if (this is int)
        this as int
      else
        (double.tryParse(toString()) ?? 0.0).round()
    ];
    return list
        .map((e) => (double.tryParse(e.toString()) ?? 0.0).round())
        .reduce((value, element) => value + element);
  }
}
