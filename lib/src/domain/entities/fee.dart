enum FeePriority {
  tommorow(144, 'Tommorow'),
  threeHours(18, '3 Hours'),
  twoHours(12, '2 Hours'),
  low(6, "slow"),
  medium(3, "medium"),
  high(1, "fast");

  final int blocks;
  final String displayName;

  int get estimatedMinutes => blocks * 10;

  const FeePriority(this.blocks, this.displayName);

  static List<FeePriority> get evm {
    return [
      low,
      medium,
      high,
    ];
  }

  static List<FeePriority> get utxo {
    return [
      tommorow,
      threeHours,
      twoHours,
    ];
  }
}
