import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  test("Multiplication", () async {
    var amount1 = Amount(value: BigInt.from(10), decimals: 0);

    var amount2 = Amount(value: BigInt.from(10), decimals: 0);

    var product = amount1 * amount2;

    expect(product.value, BigInt.from(100));

    amount1 = Amount(value: BigInt.from(10), decimals: 2);

    amount2 = Amount(value: BigInt.from(10), decimals: 0);

    product = amount1 * amount2;

    expect(product.value, BigInt.from(10000));
    expect(product.displayDouble, 100.0);
    expect(product.decimals, 2);
  });
}
