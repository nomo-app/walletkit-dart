import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import '../utils.dart';

void main() {
  final testSeed = loadFromEnv("DEV_SEED");

  final ercContract = ERC20Contract(
    contractAddress: arbitrum.contractAddress,
    rpc: arbitrumRPC,
  );
  test('Contract Interaction', () async {
    final intent = TransferIntent<EvmFeeInformation>(
      recipient: arbitrumTestWallet,
      amount: Amount.convert(value: 10, decimals: 18),
      token: arbitrum,
      memo: null,
    );

    final hash = await arbitrumRPC.sendERC20Token(
      intent: intent,
      from: arbitrumTestWallet,
      seed: testSeed,
    );
    print("hash : $hash");
  });
  test('Fetch Balance', () async {
    final balance = await ercContract.balanceOf(
      owner: arbitrumTestWallet,
    );
    print("Balance : $balance");
  });
  test('Fetch Name', () async {
    final response = await ercContract.name();
    expect(response, "Arbitrum");
  });
  test('Fetch Symbol', () async {
    final response = await ercContract.symbol();
    expect(response, "ARB");
  });
  test('Fetch Supply', () async {
    final supply = await ercContract.totalSupply();
    expect(supply.toString(), "9999999998999999999999999996");
  });
  test('Fetch Decimals', () async {
    final decimals = await ercContract.decimals();
    expect(decimals, BigInt.from(18));
  });

  test('Fetch BalanceOf', () async {
    final balance = await ercContract.balanceOf(owner: arbitrumTestWallet);
    print("Balance : $balance");
  });

  test('Fetch Allowance', () async {
    final allowance = await ercContract.allowance(
      owner: arbitrumTestWallet,
      spender: arbitrum.contractAddress,
    );
    print("Allowance : $allowance");
  });
  test("Token Info", () async {
    final tokenInfo = await getTokenInfo(
      contractAddress: arbitrum.contractAddress,
      rpc: arbitrumRPC,
    );

    print("Token Info : $tokenInfo");
  });
}
