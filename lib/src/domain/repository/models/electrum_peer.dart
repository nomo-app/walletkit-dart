import 'package:collection/collection.dart';
import 'package:walletkit_dart/src/domain/extensions.dart';

class ElectrumPeer {
  final String host;

  final String protocolVersion;
  final int? tcpPort;
  final int? sslPort;
  final String? pruningLimit;

  String get address => "$host:$tcpPort";

  const ElectrumPeer({
    required this.host,
    required this.protocolVersion,
    this.tcpPort,
    this.sslPort,
    required this.pruningLimit,
  }) : assert(tcpPort != null || sslPort != null);

  factory ElectrumPeer.fromJson({
    required String host,
    required List<dynamic> args,
    required String version,
  }) {
    final tcpPort = args
        .singleWhereOrNull((arg) => arg.toString().startsWith("t"))
        .toString()
        .substring(1)
        .toIntOrNull;

    final sslPort = args
        .singleWhereOrNull((arg) => arg.toString().startsWith("s"))
        .toString()
        .substring(1)
        .toIntOrNull;

    return ElectrumPeer(
      host: host,
      protocolVersion: version,
      pruningLimit: null,
      tcpPort: tcpPort,
      sslPort: sslPort,
    );
  }

  @override
  String toString() {
    return "$address ($protocolVersion)";
  }
}
