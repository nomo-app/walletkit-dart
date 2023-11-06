import 'dart:typed_data';

extension ByteUtil on ByteData {
  int writeUint64(int offset, int val) {
    setInt64(offset, val, Endian.little);
    return 8;
  }

  int writeUint32(int offset, int val) {
    setUint32(offset, val, Endian.little);
    return 4;
  }

  int writeUint16(int offset, int val) {
    setUint16(offset, val, Endian.little);
    return 2;
  }

  int writeUint8(int offset, int val) {
    setUint8(offset, val);
    return 1;
  }

  int writeVarInt(int offset, int val) {
    if (val < 0xfd) {
      setUint8(offset, val);
      return 1;
    }
    if (val <= 0xffff) {
      setUint8(offset, 0xfd);
      setUint16(offset + 1, val, Endian.little);
      return 3;
    }
    if (val <= 0xffffffff) {
      setUint8(offset, 0xfe);
      setUint32(offset + 1, val, Endian.little);
      return 5;
    }

    setUint8(offset, 0xff);
    setUint64(offset + 1, val, Endian.little);
    return 9;
  }

  (int, int) readUint64(int offset) {
    return (getInt64(offset, Endian.little), 8);
  }

  (int, int) readUint32(int offset) {
    return (getUint32(offset, Endian.little), 4);
  }

  (int, int) readUint16(int offset) {
    return (getUint16(offset, Endian.little), 2);
  }

  (int, int) readUint8(int offset) {
    return (getUint8(offset), 1);
  }

  (int, int) readVarInt(int offset) {
    final firstByte = getUint8(offset);
    if (firstByte < 0xfd) {
      return (firstByte, 1);
    }
    if (firstByte == 0xfd) {
      return (getUint16(offset + 1, Endian.little), 3);
    }
    if (firstByte == 0xfe) {
      return (getUint32(offset + 1, Endian.little), 5);
    }
    return (getUint64(offset + 1, Endian.little), 9);
  }
}

extension BufferUtil on Uint8List {
  ByteData get bytes => buffer.asByteData();

  int writeSlice(int offset, Uint8List slice) {
    setRange(offset, offset + slice.length, slice);
    return slice.length;
  }

  (Uint8List, int) readSlice(int offset, int length) {
    return (sublist(offset, offset + length), length);
  }

  int writeVarSlice(int offset, Uint8List slice) {
    var diff = 0;
    diff += bytes.writeVarInt(offset, slice.length);
    diff += writeSlice(offset + diff, slice);
    return diff;
  }

  (Uint8List, int) readVarSlice(int offset) {
    final (length, lengthByteLength) = bytes.readVarInt(offset);
    final (slice, sliceByteLength) =
        readSlice(offset + lengthByteLength, length);
    return (slice, lengthByteLength + sliceByteLength);
  }
}
