import 'dart:typed_data';

import 'package:dotenv/dotenv.dart';

Uint8List loadDevSeedFromEnv() {
  var env = DotEnv(includePlatformEnvironment: true)..load();
  final rejectSeedString = env["REJECT_SEED"]!.split(",");
  List<int> rejectIntList = rejectSeedString
      .map((i) => int.parse(i))
      .toList(); // Convert to list of integers
  Uint8List rejectSeed = Uint8List.fromList(rejectIntList);
  return rejectSeed;
}

Uint8List loadFromEnv(String envName) {
  var env = DotEnv(includePlatformEnvironment: true)..load();
  final seedString = env[envName]!.split(",");
  List<int> intList = seedString
      .map((i) => int.parse(i))
      .toList(); // Convert to list of integers
  Uint8List seed = Uint8List.fromList(intList);
  return seed;
}

Uint8List loadDevSeed2FromEnv() {
  return loadFromEnv("DEV_SEED");
}
