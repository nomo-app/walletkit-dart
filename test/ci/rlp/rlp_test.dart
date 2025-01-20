import 'dart:convert';
import 'dart:io';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/evm/evm.dart';
import 'package:walletkit_dart/src/domain/extensions.dart';

void main() {
  group(
    "Basic DataTypes",
    () {
      group(
        "String RLP",
        () {
          test('should return itself if single byte and less than 0x7f', () {
            final encodedSelf = encodeRLP(RLPItem.fromValue('a'));
            expect(encodedSelf.bytesToUTF8, 'a');
          });

          test('should return 0x80 + length if less than 56 bytes', () {
            final encoded = encodeRLP(RLPItem.fromValue('dog'));
            expect(encoded.length, 4);
            expect(encoded[0], 0x83);
            expect(encoded[1], 0x64);
            expect(encoded[2], 0x6f);
            expect(encoded[3], 0x67);
          });

          test(
              'length of string >55 should return 0xb7+len(len(data)) plus len(data) plus data',
              () {
            final encoded = encodeRLP(
              RLPItem.fromValue(
                  'zoo255zoo255zzzzzzzzzzzzssssssssssssssssssssssssssssssssssssssssssssss'),
            );
            expect(encoded.length, 72);
            expect(encoded[0], 184);
            expect(encoded[1], 70);
            expect(encoded[2], 122);
            expect(encoded[3], 111);
            expect(encoded[12], 53);
          });
        },
      );

      group(
        "RLP encoding List",
        () {
          test(
            "length of list 0-55 should return (0xc0+len(data)) plus data",
            () {
              final encoded = encodeRLP(
                RLPItem.fromValue(['cat', 'god', 'cat']),
              );

              expect(encoded.length, 13);
              expect(encoded[0], 204);
              expect(encoded[1], 131);
              expect(encoded[11], 97);
              expect(encoded[12], 116);
            },
          );

          test(
            "length of list >55 should return 0xf7+len(len(data)) plus len(data) plus data",
            () {
              final data = [
                "dog",
                "god",
                "cat",
                "zoo255zoo255zzzzzzzzzzzzssssssssssssssssssssssssssssssssssssssssssssss",
              ];
              final encoded = encodeRLP(RLPItem.fromValue(data));
              final str = encoded.bytesToUTF8;
              for (final innerstr in data) {
                expect(str.contains(innerstr), true);
              }

              expect(
                encoded.toHex,
                "f85483646f6783676f6483636174b8467a6f6f3235357a6f6f3235357a7a7a7a7a7a7a7a7a7a7a7a73737373737373737373737373737373737373737373737373737373737373737373737373737373737373737373",
              );
            },
          );
        },
      );

      group(
        "RLP Encoding BigInt",
        () {
          test(
            "Should encode a BigInt",
            () {
              final encoded = encodeRLP(RLPItem.fromValue(BigInt.from(3)));
              expect(encoded.length, 1);
              expect(encoded[0], 3);
            },
          );

          test(
            "length of bigint > 55, similar to string",
            () {
              final encoded = encodeRLP(RLPBigInt(BigInt.from(1024)));
              expect(encoded.length, 3);
              expect(encoded[0], 0x82);
              expect(encoded[1], 0x04);
              expect(encoded[2], 0x00);
            },
          );

          test(
            "It should handle zero",
            () {
              final encoded = encodeRLP(RLPBigInt(BigInt.from(0)));
              expect(encoded.length, 1);
              expect(encoded[0], 0x80);
            },
          );
        },
      );

      group(
        "RLP Encoding Integer",
        () {},
      );
    },
  );

  final officialFixtures = json.decode(
    File('./test/ci/rlp/fixtures/rlptest.json').readAsStringSync(
      encoding: utf8,
    ),
  );

  final officialTests = officialFixtures['tests'];

  group(
    "Offical Tests",
    () {
      for (var MapEntry(
            key: String name,
            value: Map<String, dynamic> _test,
          ) in officialTests.entries) {
        test(
          "$name",
          () {
            final input = _test['in'];

            final output = "0x" + encodeRLP(RLPItem.fromValue(input)).toHex;

            expect(output, _test['out']);
          },
        );
      }
    },
  );

  // final gethTests = json.decode(
  //   File('./test/ci/rlp/fixtures/geth.json').readAsStringSync(
  //     encoding: utf8,
  //   ),
  // ) as List;

  // group(
  //   "GETH Tests",
  //   () {
  //     for (final {
  //           "input": String input,
  //           "value": dynamic testValue,
  //         } in gethTests) {
  //       test(
  //         "$input",
  //         () {
  //           final inputBuffer = input.hexToBytes;

  //           final value = decodeRLP(inputBuffer);

  //           expect(value, testValue);
  //         },
  //       );
  //     }
  //   },
  // );

  final invalidFixtures = json.decode(
    File('./test/ci/rlp/fixtures/invalid.json').readAsStringSync(
      encoding: utf8,
    ),
  );

  final invalidTests = invalidFixtures['tests'];

  group(
    "Invalid Tests",
    () {
      for (var MapEntry(
            key: String name,
            value: Map<String, dynamic> _test,
          ) in invalidTests.entries) {
        test(
          "$name",
          () {
            var out = _test['out'] as String;

            if (out.startsWith("0x")) {
              out = out.substring(2);
            }

            try {
              final _ = decodeRLP(out.hexToBytes);

              fail("Expected to throw but didn't");
            } on TestFailure {
              fail("Expected to throw but didn't");
            } catch (e) {
              expect(true, true);
            }
          },
        );
      }
    },
  );

  final invalidGethCases = [
    'F800',
    'BA0002FFFF',
    'B90000',
    'B800',
    '817F',
    '8100',
    '8101',
    'C8C9010101010101010101',
    'F90000',
    'F90055',
    'FA0002FFFF',
    'BFFFFFFFFFFFFFFFFFFF',
    'C801',
    'CD04040404FFFFFFFFFFFFFFFFFF0303',
    'C40102030401',
    'C4010203048180',
    '81',
    'BFFFFFFFFFFFFFFF',
    'C801',
    'c330f9c030f93030ce3030303030303030bd303030303030',
    '8105',
    'B8020004',
    'F8020004',
  ];

  group(
    "Invalid Geth Cases",
    () {
      for (final input in invalidGethCases) {
        test(
          "$input",
          () {
            try {
              final _ = decodeRLP(input.hexToBytes);

              fail("Expected to throw but didn't");
            } on TestFailure {
              fail("Expected to throw but didn't");
            } catch (e) {
              expect(true, true);
            }
          },
        );
      }
    },
  );
}
