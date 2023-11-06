import 'package:hive/hive.dart';
import 'package:walletkit_dart/src/domain/extensions.dart';

part 'staking_nft_entity.g.dart';

@HiveType(typeId: 11)
class StakingNftEntity {
  @HiveField(0)
  final bool isActive;
  @HiveField(1)
  final BigInt tokenId;
  @HiveField(2)
  final double amount;
  @HiveField(3)
  final double payoutFactor;
  @HiveField(4)
  final double? claimedRewards;
  @HiveField(5)
  final double? apy;
  @HiveField(6)
  final DateTime start;
  @HiveField(7)
  final DateTime end;
  @HiveField(8)
  final DateTime lastClaim;

  factory StakingNftEntity.fromContractJson(
    List<dynamic> rawStakingNft,
    BigInt tokenID,
  ) {
    final start = DateTime.fromMillisecondsSinceEpoch(
      (rawStakingNft[1] as BigInt).toInt() * 1000,
    );
    final end = DateTime.fromMillisecondsSinceEpoch(
      (rawStakingNft[2] as BigInt).toInt() * 1000,
    );
    final lastClaim = DateTime.fromMillisecondsSinceEpoch(
      (rawStakingNft[3] as BigInt).toInt() * 1000,
    );

    final amount = (rawStakingNft[4] as BigInt).toDouble() / 1e18;

    final payoutFactor = (rawStakingNft[5] as BigInt).toDouble() / 1e18;
    var years = end.year - start.year;

    final apy = ((100 * (payoutFactor - 1.0)) / years).toPrecision(3);

    final claimedRewards = amount *
        payoutFactor *
        ((lastClaim.microsecondsSinceEpoch - start.microsecondsSinceEpoch) /
            (end.microsecondsSinceEpoch - start.microsecondsSinceEpoch));

    return StakingNftEntity(
      isActive: rawStakingNft[0],
      tokenId: tokenID,
      amount: amount,
      payoutFactor: payoutFactor,
      claimedRewards: claimedRewards,
      apy: apy,
      start: start,
      end: end,
      lastClaim: lastClaim,
    );
  }

  StakingNftEntity({
    required this.isActive,
    required this.tokenId,
    required this.amount,
    required this.payoutFactor,
    this.claimedRewards,
    this.apy,
    required this.start,
    required this.end,
    required this.lastClaim,
  });

  StakingNftEntity updateRewards(double rewards) {
    return StakingNftEntity(
      isActive: isActive,
      tokenId: tokenId,
      amount: amount,
      payoutFactor: payoutFactor,
      start: start,
      end: end,
      lastClaim: lastClaim,
    );
  }
}
