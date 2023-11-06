import 'package:walletkit_dart/src/domain/extensions.dart';

class ERC721Entity {
  final int blockNumber;
  final String hash;
  final BigInt tokenID;
  final String contractAddress;
  final String to;
  final String from;
  final String tokenName;
  final DateTime dateTime;


  const ERC721Entity({
    required this.blockNumber,
    required this.hash,
    required this.tokenID,
    required this.contractAddress,
    required this.to,
    required this.from,
    required this.tokenName,
    required this.dateTime,
  });

  factory ERC721Entity.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'blockNumber': String blockNumber_s,
          'timeStamp': String timeStamp_s,
          'hash': String hash,
          'tokenID': String tokenID_s,
          'contractAddress': String contractAddress,
          'to': String to,
          'from': String from,
          'tokenName': String tokenName,
        }) {
      final blockNumber = blockNumber_s.toIntOrNull ?? -1;
      final timeStamp = timeStamp_s.toIntOrNull ?? -1;
      final tokenId = tokenID_s.toBigIntOrNull ?? BigInt.zero;
      final dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);

      return ERC721Entity(
        blockNumber: blockNumber,
        hash: hash,
        tokenID: tokenId,
        contractAddress: contractAddress,
        to: to,
        from: from,
        tokenName: tokenName,
        dateTime: dateTime,
      );
    }

    throw UnimplementedError();
  }

  @override
  String toString() {
    return 'ERC721Entity{blockNumber: tokenID: $tokenID, contractAddress: $contractAddress, tokenName: $tokenName}';
  }
}
