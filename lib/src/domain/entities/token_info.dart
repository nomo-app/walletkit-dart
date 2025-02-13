///
/// Info which we get over the Smart Contract of an Token
///
class TokenInfo {
  final int decimals;
  final num maxSupply;
  final String symbol;
  final String name;
  final String contractAddress;
  final int? id;

  const TokenInfo({
    required this.decimals,
    required this.maxSupply,
    required this.symbol,
    required this.name,
    required this.contractAddress,
    this.id,
  });
}
