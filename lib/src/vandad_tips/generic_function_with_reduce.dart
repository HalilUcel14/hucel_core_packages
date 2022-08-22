T plus<T extends num>(T lhs, T rhs) => (lhs + rhs) as T;
T minus<T extends num>(T lhs, T rhs) => (lhs - rhs) as T;
T multiply<T extends num>(T lhs, T rhs) => (lhs * rhs) as T;
T divide<T extends num>(T lhs, T rhs) {
  if (lhs is int && rhs is int) {
    return (lhs ~/ rhs) as T;
  } else {
    return (lhs / rhs) as T;
  }
}

const values = [100, 5, 2];

void testIt() {
  [
    values.reduce(plus), // = 107
    values.reduce(minus), // = 93
    values.reduce(multiply), // = 1000
    values.reduce(divide), // = 10
  ].forEach(print);
}
