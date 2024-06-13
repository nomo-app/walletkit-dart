import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  group('Amount Operations', () {
    test('Convert', () {
      final bitcoin_amount_double = 1.1;

      var amount = Amount.convert(value: bitcoin_amount_double, decimals: 8);

      expect(amount.value, equals(110000000.toBigInt));

      final eth_amount_double = 1.1;

      amount = Amount.convert(value: eth_amount_double, decimals: 18);

      expect(amount.value, equals(1100000000000000000.toBigInt));
    });

    test('Multiplication', () {
      var a = Amount(value: BigInt.from(2), decimals: 2);
      var b = Amount(value: BigInt.from(3), decimals: 2);
      var result = a * b;
      var dResult = a.displayDouble * b.displayDouble;

      expect(result.value, equals(BigInt.from(6)));
      expect(result.decimals, equals(4));
      expect(result.displayDouble, dResult);

      a = Amount(value: BigInt.from(22323), decimals: 2);
      b = Amount(value: BigInt.from(312), decimals: 4);
      result = a * b;
      dResult = a.displayDouble * b.displayDouble;

      expect(result.value, equals(BigInt.from(6964776)));
      expect(result.decimals, equals(6));
      expect(result.displayDouble, dResult);
    });

    test('Addition', () {
      final a = Amount(value: BigInt.from(2), decimals: 2);
      final b = Amount(value: BigInt.from(3), decimals: 2);

      final result = a + b;

      expect(result.value, equals(BigInt.from(5)));
      expect(result.decimals, equals(2));
    });

    test('Subtraction', () {
      final a = Amount(value: BigInt.from(3), decimals: 2);
      final b = Amount(value: BigInt.from(2), decimals: 2);

      final result = a - b;

      expect(result.value, equals(BigInt.from(1)));
      expect(result.decimals, equals(2));
    });

    test('Division', () {
      var a = Amount(value: BigInt.from(4), decimals: 2);
      var b = Amount(value: BigInt.from(2), decimals: 2);
      var result = a / b;
      expect(result.value, equals(BigInt.from(2)));
      expect(result.decimals, equals(2));

      a = Amount(value: BigInt.from(4), decimals: 2);
      b = Amount(value: BigInt.from(2), decimals: 4);

      result = a / b;
      var dResult = a.displayDouble / b.displayDouble;
      expect(result.value, equals(BigInt.from(2000000)));
      expect(result.displayDouble, dResult);
      expect(result.decimals, equals(4));

      a = Amount(value: BigInt.from(441212), decimals: 4);
      b = Amount(value: BigInt.from(69), decimals: 2);
      result = a / b;
      dResult = a.displayDouble / b.displayDouble;

      expect(result.value, equals(BigInt.from(639437)));
      //   expect(result.displayDouble, dResult);
      expect(result.decimals, equals(4));
    });

    test('GreaterThanCheck', () {
      final a = Amount(value: BigInt.from(3), decimals: 2);
      final b = Amount(value: BigInt.from(2), decimals: 2);

      expect(a > b, equals(true));
    });

    test('LessThanCheck', () {
      final a = Amount(value: BigInt.from(2), decimals: 2);
      final b = Amount(value: BigInt.from(3), decimals: 2);

      expect(a < b, equals(true));
    });
  });
}
