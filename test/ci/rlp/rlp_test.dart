import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/evm/evm.dart';
import 'package:walletkit_dart/src/domain/extensions.dart';

void main() {
  group("Basic DataTypes", () {
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

        test('length of string >55 should return 0xb7+len(len(data)) plus len(data) plus data', () {
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

            final decoded = decodeRLP(encoded).$1;
            expect(decoded.buffer.toUBigInt, BigInt.from(1024));
          },
        );

        test(
          "It should handle zero",
          () {
            final encoded = encodeRLP(RLPBigInt(BigInt.from(0)));
            expect(encoded.length, 1);
            expect(encoded[0], 0x80);

            final decoded = decodeRLP(encoded).$1;
            expect(decoded.buffer.toUBigInt, BigInt.zero);
          },
        );
      },
    );

    group(
      "RLP Encoding Integer",
      () {
        test(
          "length of int = 1, less than 0x7f",
          () {
            final encoded = encodeRLP(RLPInt(15));
            expect(1, encoded.length);
            expect(encoded[0], 15);
          },
        );

        test(
          "length of int > 55",
          () {
            final encoded = encodeRLP(RLPInt(1024));
            expect(encoded.length, 3);
            expect(encoded[0], 130);
            expect(encoded[1], 4);
            expect(encoded[2], 0);
          },
        );

        test(
          "it should handle zeros",
          () {
            final encoded = encodeRLP(RLPInt(0));
            expect(encoded.length, 1);
            expect(encoded[0], 0x80);
          },
        );
      },
    );
    group('Invalid RLPs', () {
      test('should not crash on invalid RLP data', () {
        final invalidCases = [
          Uint8List.fromList([0xef, 0xde, 0xbd]),
          Uint8List.fromList([0xef, 0xb8, 0x36, 0x00]),
        ];

        for (final input in invalidCases) {
          expect(
            () => decodeRLP(input),
            throwsA(isA<RLPException>()),
          );
        }
      });
    });

    group('RLP Decoding String', () {
      test('first byte < 0x7f, return byte itself', () {
        final (decoded, _) = decodeRLP(
          Uint8List.fromList(
            [97],
          ),
        );
        expect(decoded.buffer.length, 1);
        expect(decoded.buffer.bytesToUTF8, 'a');
      });

      test('first byte < 0xb7, data is everything except first byte', () {
        final (decoded, _) = decodeRLP(
          Uint8List.fromList([131, 100, 111, 103]),
        );
        expect(decoded.buffer.length, 3);
        expect(decoded.buffer.bytesToUTF8, 'dog');
      });

      test('should decode string array', () {
        final (decoded as RLPList, _) = decodeRLP(
          Uint8List.fromList([204, 131, 100, 111, 103, 131, 103, 111, 100, 131, 99, 97, 116]),
        );

        expect(
          decoded.value.map((item) => item.buffer.bytesToUTF8).toList(),
          ['dog', 'god', 'cat'],
        );
      });
    });

    group('Strings over 55 bytes', () {
      const testString =
          'This function takes in data, converts it to bytes, and adds a length for recursion';
      late Uint8List encoded;

      test('should encode correctly', () {
        encoded = encodeRLP(RLPString(testString));
        expect(encoded[0], 184);
        expect(encoded[1], 82);
      });

      test('should decode back to original', () {
        final decoded = decodeRLP(encoded).$1.buffer.bytesToUTF8;
        expect(decoded, testString);
      });
    });

    test('List over 55 bytes', () {
      final testList = [
        'This',
        'function',
        'takes',
        'in',
        'a',
        'data',
        'convert',
        'it',
        'to',
        'bytes',
        'if',
        'not',
        'and',
        'a',
        'length',
        'for',
        'recursion',
        'a1',
        'a2',
        'a3',
        'ia4',
        'a5',
        'a6',
        'a7',
        'a8',
        'ba9'
      ];
      final encoded = encodeRLP(RLPList(testList.map((s) => RLPString(s)).toList()));
      final decoded = decodeRLP(encoded).$1 as RLPList;
      expect(
        decoded.hexValues.map((item) => item.hexToBytes.bytesToUTF8).toList(),
        testList,
      );
    });

    group('Nested lists', () {
      test('should encode and decode empty nested lists', () {
        final nestedList = [
          [],
          [[]],
          [
            [],
            [[]]
          ],
        ];

        final rlpList = RLPItem.fromValue(nestedList);

        final encoded = encodeRLP(rlpList);

        expect(
          encoded,
          Uint8List.fromList([0xc7, 0xc0, 0xc1, 0xc0, 0xc3, 0xc0, 0xc1, 0xc0]),
        );

        final decoded = decodeRLP(encoded).$1;

        expect(decoded.toString(), rlpList.toString());
      });

      test('should encode and decode lists with values', () {
        final valueList = [
          [1, 2, 3],
          [
            Uint8List.fromList([4, 5, 6]),
            Uint8List.fromList([7, 8, 9]),
            [
              Uint8List.fromList([0]),
              ('abcd'.hexToBytes)
            ],
          ],
        ];

        final encoded = encodeRLP(RLPItem.fromValue(valueList));

        expect(
          encoded,
          Uint8List.fromList([
            0xd2,
            0xc3,
            0x01,
            0x02,
            0x03,
            0xcd,
            0x83,
            0x04,
            0x05,
            0x06,
            0x83,
            0x07,
            0x08,
            0x09,
            0xc4,
            0x00,
            0x82,
            0xab,
            0xcd
          ]),
        );
      });
    });

    group('Null and zero values', () {
      test('should encode and decode null values in list', () {
        final encoded = encodeRLP(RLPList([
          RLPNull(),
        ]));
        expect(encoded, Uint8List.fromList([0xc1, 0x80]));
      });

      test('should decode null value', () {
        final decoded = decodeRLP(('80'.hexToBytes)).$1.buffer;
        expect(decoded, Uint8List.fromList([]));
      });

      test('should encode and decode zero', () {
        final encoded = encodeRLP(RLPBytes(Uint8List.fromList([0])));
        expect(encoded, Uint8List.fromList([0]));

        final decoded = decodeRLP(Uint8List.fromList([0])).$1;
        expect(decoded.buffer, Uint8List.fromList([0]));
      });

      test('should decode empty list', () {
        final decoded = decodeRLP(Uint8List.fromList([0xc0])).$1;
        expect(decoded.buffer, Uint8List.fromList([]));
      });
    });

    group('Invalid encodings', () {
      test('should reject invalid RLP encodings', () {
        final invalidCases = [
          // Invalid length prefix
          'f86081000182520894b94f5374fce5edbc8e2a8697c15331677e6ebf0b0a801ca098ff921201554726367d2be8c804a7ff89ccf285ebc57dff8ae4c44b9c19ac4aa08887321be575c8095f789dd4c743dfe42c1820f9231f98a962b210e3ac2452a3',
          // Extra data at end: Is actually a valid RLP. The extra data is just an empty List.
          // 'f90260f901f9a02a3c692012a15502ba9c39f3aebb36694eed978c74b52e6c0cf210d301dbf325a01dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d49347948888f1f195afa192cfee860698584c030f4c9db1a0ef1552a40b7165c3cd773806b9e0c165b75356e0314bf0706f279c729f51e017a0b6c9fd1447d0b414a1f05957927746f58ef5a2ebde17db631d460eaf6a93b18da0bc37d79753ad738a6dac4921e57392f145d8887476de3f783dfa7edae9283e52b90100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008302000001832fefd8825208845509814280a00451dd53d9c09f3cfb627b51d9d80632ed801f6330ee584bffc26caac9b9249f88c7bffe5ebd94cc2ff861f85f800a82c35094095e7baea6a6c7c4c2dfeb977efac326af552d870a801ba098c3a099885a281885f487fd37550de16436e8c47874cd213531b10fe751617fa044b6b81011ce57bffcaf610bf728fb8a7237ad261ea2d937423d78eb9e137076c0',
        ];

        for (final hexInput in invalidCases) {
          expect(
            () => decodeRLPCheck((hexInput.hexToBytes)),
            throwsA(isA<RLPException>()),
          );
        }
      });
    });

    group('Leading zeros', () {
      test('should correctly encode single byte with leading zeros', () {
        // A single zero byte should encode to itself
        final encoded1 = encodeRLP(RLPBytes(Uint8List.fromList([0x00])));
        expect(encoded1, equals(Uint8List.fromList([0x00])));

        // Multiple leading zeros for a single byte value should be preserved
        final encoded2 = encodeRLP(RLPBytes(Uint8List.fromList([0x00, 0x01])));
        expect(encoded2, equals(Uint8List.fromList([0x82, 0x00, 0x01])));
      });

      test('should correctly handle numbers with leading zeros', () {
        // Number that could be encoded in single byte but has leading zeros
        final encoded1 = encodeRLP(RLPInt(0x000000001)); // 1 with leading zeros
        expect(
          encoded1,
          equals(
            Uint8List.fromList(
              [0x01],
            ),
          ),
        ); // Should strip leading zeros for integers

        // Explicitly preserve leading zeros using bytes
        final encoded2 = encodeRLP(RLPBytes(Uint8List.fromList([0x00, 0x01])));
        expect(
          encoded2,
          equals(
            Uint8List.fromList(
              [0x82, 0x00, 0x01],
            ),
          ),
        ); // Should preserve leading zeros
      });

      test('should correctly decode values with leading zeros', () {
        // Decode single byte zero
        final decoded1 = decodeRLP(Uint8List.fromList([0x00])).$1.buffer;
        expect(decoded1, equals(Uint8List.fromList([0x00])));

        // Decode multiple bytes with leading zeros
        final decoded2 = decodeRLP(Uint8List.fromList([0x82, 0x00, 0x01])).$1.buffer;
        expect(decoded2, equals(Uint8List.fromList([0x00, 0x01])));

        // This is a tricky case - make sure the length prefix is handled correctly
        // when there are leading zeros in the input
        final decoded3 = decodeRLP(Uint8List.fromList([0x82, 0x00, 0x80])).$1.buffer;
        expect(decoded3, equals(Uint8List.fromList([0x00, 0x80])));
      });

      test('should handle leading zeros in lists', () {
        final list = [
          Uint8List.fromList([0x00]),
          Uint8List.fromList([0x00, 0x01]),
          Uint8List.fromList([0x00, 0x00, 0x00]),
        ];

        final encoded = encodeRLP(RLPList(list.map((b) => RLPBytes(b)).toList()));
        final decoded = decodeRLP(encoded).$1 as RLPList;

        expect(decoded.length, equals(3));
        expect(decoded[0].buffer, equals(Uint8List.fromList([0x00])));
        expect(decoded[1].buffer, equals(Uint8List.fromList([0x00, 0x01])));
        expect(decoded[2].buffer, equals(Uint8List.fromList([0x00, 0x00, 0x00])));
      });
    });
  });

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

  final gethTests = json.decode(
    File('./test/ci/rlp/fixtures/geth.json').readAsStringSync(
      encoding: utf8,
    ),
  ) as List;

  group(
    "GETH Tests",
    () {
      for (final {
            "input": String input,
            "value": dynamic testValue,
          } in gethTests) {
        test(
          "$input",
          () {
            final inputBuffer = input.hexToBytes;

            final item = decodeRLP(inputBuffer).$1;

            if (item is RLPList) {
              expect(item.hex, "$testValue");
            } else {
              expect(item.hex, testValue);
            }
          },
        );
      }
    },
  );

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
              final result = decodeRLP(out.hexToBytes);
              print(result);
              fail("Expected to throw but didn't");
            } on TestFailure {
              fail("Expected to throw but didn't");
            } catch (e) {
              print("$e");
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
              final _ = decodeRLP(input.hexToBytes).$1;

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
