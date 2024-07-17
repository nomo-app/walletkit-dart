import 'dart:math';

import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  group('Amount Operations', () {
    test('Convert', () {
      const bitcoin_amount_double = 1.1;

      var amount = Amount.convert(value: bitcoin_amount_double, decimals: 8);

      expect(amount.value, equals(110000000.toBigInt));

      const eth_amount_double = 1.1;

      amount = Amount.convert(value: eth_amount_double, decimals: 18);

      expect(amount.value, equals(1100000000000000000.toBigInt));
    });

    group('Amount multiplication operator', () {
      test('multiplication with the same decimals', () {
        Amount amount1 = Amount(value: BigInt.from(1000), decimals: 18);
        Amount amount2 = Amount(value: BigInt.from(2000), decimals: 18);

        Amount result = amount1 * amount2;
        expect(
            result.value, BigInt.from(2000000)); // 2,000,000 with 36 decimals
        expect(result.decimals, 36);
      });

      test('multiplication with different decimals', () {
        Amount amount1 = Amount(value: BigInt.from(1000), decimals: 18);
        Amount amount2 = Amount(value: BigInt.from(2), decimals: 15);

        Amount result = amount1 * amount2;

        expect(result.value, BigInt.from(2000)); // 2,000 with 33 decimals
        expect(result.decimals, 33); // sum of 18 + 15
      });

      test('multiplication by zero', () {
        Amount amount1 = Amount(value: BigInt.from(1000), decimals: 18);
        Amount amount2 = Amount(value: BigInt.from(0), decimals: 18);

        Amount result = amount1 * amount2;
        expect(result.value, BigInt.from(0)); // 0 with 36 decimals
        expect(result.decimals, 36);
      });

      test('large number multiplication', () {
        Amount amount1 =
            Amount(value: BigInt.parse('1000000000000000000'), decimals: 18);
        Amount amount2 =
            Amount(value: BigInt.parse('2000000000000000000'), decimals: 18);

        Amount result = amount1 * amount2;
        expect(
            result.value,
            BigInt.parse(
                '2000000000000000000000000000000000000')); // large number with 36 decimals
        expect(result.decimals, 36);
      });

      test('multiplication where decimals are a factor', () {
        Amount amount1 = Amount(value: BigInt.from(1000), decimals: 18);
        Amount amount2 = Amount(value: BigInt.from(1), decimals: 17);

        Amount result = amount1 * amount2;
        expect(result.value, BigInt.from(1000)); // 1,000 with 35 decimals
        expect(result.decimals, 35);
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
    });

    group('Amount plus operator', () {
      test('addition with the same decimals', () {
        Amount amount1 = Amount(value: BigInt.from(10000), decimals: 18);
        Amount amount2 = Amount(value: BigInt.from(2000), decimals: 18);

        Amount result = amount1 + amount2;
        expect(result.value, BigInt.from(12000)); // 12000 with 18 decimals
        expect(result.decimals, 18);
      });

      test('addition with different decimals', () {
        Amount amount1 = Amount(value: BigInt.from(10000), decimals: 18);
        Amount amount2 = Amount(value: BigInt.from(2), decimals: 15);

        Amount result = amount1 + amount2;

        expect(result.value, BigInt.from(12000)); // 12000 with 18 decimals
        expect(result.decimals, 18);
      });

      test('addition resulting in zero', () {
        Amount amount1 = Amount(value: BigInt.from(0), decimals: 18);
        Amount amount2 = Amount(value: BigInt.from(0), decimals: 18);

        Amount result = amount1 + amount2;
        expect(result.value, BigInt.from(0)); // 0 with 18 decimals
        expect(result.decimals, 18);
      });

      test('large number addition', () {
        Amount amount1 = Amount(
            value: BigInt.parse('1000000000000000000000000'), decimals: 18);
        Amount amount2 = Amount(
            value: BigInt.parse('1000000000000000000000000'), decimals: 18);

        Amount result = amount1 + amount2;
        expect(
            result.value,
            BigInt.parse(
                '2000000000000000000000000')); // 2,000,000 with 18 decimals
        expect(result.decimals, 18);
      });

      test('addition where decimals are a factor', () {
        Amount amount1 = Amount(value: BigInt.from(1000), decimals: 18);
        Amount amount2 = Amount(value: BigInt.from(1), decimals: 17);

        Amount result = amount1 + amount2;
        expect(result.value, BigInt.from(1010)); // 1010 with 18 decimals
        expect(result.decimals, 18);
      });
    });

    group('Amount minus operator', () {
      test('subtraction with the same decimals', () {
        Amount amount1 = Amount(value: BigInt.from(10000), decimals: 18);
        Amount amount2 = Amount(value: BigInt.from(2000), decimals: 18);

        Amount result = amount1 - amount2;
        expect(result.value, BigInt.from(8000)); // 8000 with 18 decimals
        expect(result.decimals, 18);
      });

      test('subtraction with different decimals', () {
        Amount amount1 = Amount(value: BigInt.from(10000), decimals: 18);
        Amount amount2 = Amount(value: BigInt.from(2), decimals: 15);

        Amount result = amount1 - amount2;

        expect(result.value, BigInt.from(8000)); // 8000 with 18 decimals
        expect(result.decimals,
            18); // because we are normalizing to max decimals initially
      });

      test('subtraction resulting in zero', () {
        Amount amount1 = Amount(value: BigInt.from(10000), decimals: 18);
        Amount amount2 = Amount(value: BigInt.from(10000), decimals: 18);

        Amount result = amount1 - amount2;
        expect(result.value, BigInt.from(0)); // 0 with 18 decimals
        expect(result.decimals, 18);
      });

      test('subtraction resulting in negative value', () {
        Amount amount1 = Amount(value: BigInt.from(1000), decimals: 18);
        Amount amount2 = Amount(value: BigInt.from(2000), decimals: 18);

        Amount result = amount1 - amount2;
        expect(result.value, BigInt.from(-1000)); // -1000 with 18 decimals
        expect(result.decimals, 18);
      });

      test('subtraction where decimals are a factor', () {
        Amount amount1 = Amount(value: BigInt.from(1000), decimals: 18);
        Amount amount2 = Amount(value: BigInt.from(1), decimals: 17);

        Amount result = amount1 - amount2;
        expect(result.value, BigInt.from(990)); // 990 with 18 decimals
        expect(result.decimals, 18);
      });
    });

    group('Amount division operator', () {
      test('division with same decimals', () {
        Amount amount1 = Amount(value: BigInt.from(10000), decimals: 18);
        Amount amount2 = Amount(value: BigInt.from(2000), decimals: 18);

        Amount result = amount1 / amount2;
        expect(result.value,
            BigInt.from(5) * BigInt.from(pow(10, 18))); // 5 with 18 decimals
        expect(result.decimals, 18);
      });

      test('division with different decimals', () {
        Amount amount1 = Amount(value: BigInt.from(10000), decimals: 18);
        Amount amount2 = Amount(value: BigInt.from(2000), decimals: 15);

        Amount result = amount1 / amount2;

        expect(result.value, BigInt.from(5) * BigInt.from(pow(10, 15))); //
        expect(result.decimals, 18);
      });

      test('division by a small amount', () {
        Amount amount1 = Amount(value: BigInt.from(10000), decimals: 18);
        Amount amount2 = Amount(value: BigInt.from(1), decimals: 18);

        Amount result = amount1 / amount2;
        expect(
            result.value,
            BigInt.from(10000) *
                BigInt.from(pow(10, 18))); // 10000 with 18 decimals
        expect(result.decimals, 18);
      });

      test('large number division', () {
        Amount amount1 = Amount(
            value: BigInt.parse('1000000000000000000000000'), decimals: 18);
        Amount amount2 =
            Amount(value: BigInt.parse('1000000000000000000'), decimals: 18);

        Amount result = amount1 / amount2;
        expect(
            result.value,
            BigInt.from(1000000) *
                BigInt.from(pow(10, 18))); // 1,000,000 with 18 decimals
        expect(result.decimals, 18);
      });

      test('division by zero', () {
        Amount amount1 = Amount(value: BigInt.from(10000), decimals: 18);
        Amount amount2 = Amount(value: BigInt.from(0), decimals: 18);

        expect(() => amount1 / amount2, throwsA(isA<ArgumentError>()));
      });

      test('zero division', () {
        Amount amount1 = Amount(value: BigInt.from(0), decimals: 18);
        Amount amount2 = Amount(value: BigInt.from(10000), decimals: 18);

        Amount result = amount1 / amount2;
        expect(result.value, BigInt.from(0));
        expect(result.decimals, 18);
      });
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
