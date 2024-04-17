import 'package:convert/convert.dart' as convert;
import 'package:grpc/grpc.dart';
import 'package:walletkit_dart/src/crypto/tron/rpc/api/api.pbgrpc.dart';

Future<void> main(List<String> args) async {
  final channel = ClientChannel(
    "grpc.trongrid.io",
    port: 50051,
    options: ChannelOptions(
      credentials: ChannelCredentials.secure(),
      codecRegistry:
          CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    ),
  );

  final client = WalletClient(channel);

  try {
    final result = await client.getBlock(BlockReq());
    print(result.blockHeader.rawData.number);
    print(convert.hex.encode(result.blockid));
  } catch (e) {
    print('Caught error: $e');
  }
  await channel.shutdown();
}
