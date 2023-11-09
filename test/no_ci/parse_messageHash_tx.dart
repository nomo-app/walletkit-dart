import 'dart:convert';
import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:test/test.dart';

void main() {
  test('Parse a message hex to Transaction', () {
    int bytesToInt(Uint8List bytes) {
      int result = 0;
      for (int byte in bytes) {
        result = result * 256 + byte;
      }
      return result;
    }

    int decodeInt(Uint8List data, int index) {
      if (index < data.length && data[index] <= 0x7f) {
        return data[index];
      } else {
        int length = index < data.length ? data[index] - 0x80 : 0;
        int endIndex = index + 1 + length;
        endIndex = endIndex <= data.length ? endIndex : data.length;
        return bytesToInt(data.sublist(index + 1, endIndex));
      }
    }

    const String messageHex =
        "0xf38207418502540be4008252089405870f1507d820212e921e1f39f14660336231d188016345785d8a0000808559454e49518080";

    final message = Uint8List.fromList(
      hex.decode(
        messageHex.replaceFirst("0x", ""),
      ),
    );

    int nonce = decodeInt(message, 1);

    int gasPrice = decodeInt(message, 4);

    int gasLimit = decodeInt(message, 10);
    // int toIndex = 6; // Set the correct index for "to" value
    // int toLength = message[toIndex] - 0x80;
    // int toEndIndex = toIndex + 1 + toLength;
    // toEndIndex = toEndIndex <= message.length ? toEndIndex : message.length;
    // Uint8List toBytes = message.sublist(toIndex + 1, toEndIndex);
    // String toValue = hex.encode(toBytes);
    // print("To: 0x$toValue");

    expect(nonce, 1857);
    expect(gasPrice, 10000000000);
    expect(gasLimit, 21000);
  });
}
