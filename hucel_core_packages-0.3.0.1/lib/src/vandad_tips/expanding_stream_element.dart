Stream<int> nestedEvents(int count) {
  return Stream.periodic(
    const Duration(seconds: 1),
    (e) => e,
  ).take(count).asyncExpand(
        (event) => Stream.fromIterable(
          Iterable.generate(event + 1),
        ),
      );
}
