typedef NumberOperator<T extends num> = T Function(T, T);

num add(num a, num b) => a + b;
num sub(num lhs, num rhs) => lhs - rhs;
num mul(num lhs, num rhs) => lhs * rhs;
num div(num lhs, num rhs) => lhs / rhs;

List<num> batch<T extends num>(
    T lhs, T rhs, List<NumberOperator<T>> operators) {
  return operators.map((e) => e(lhs, rhs)).toList();
}

// void testIt() {
//   assert(add is NumberOperator<num>);
//   assert(sub is NumberOperator<num>);
//   assert(mul is NumberOperator<num>);
//   assert(div is NumberOperator<num>);
//   final values = batch(6, 3, [add, sub, mul, div]);
// }
