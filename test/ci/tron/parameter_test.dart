import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/tron/entities/tron_parameter_type.dart';
import 'package:walletkit_dart/src/crypto/tron/entities/tron_transaction.dart';
import 'package:walletkit_dart/src/domain/entities/amount.dart';
import 'package:walletkit_dart/src/domain/extensions.dart';

import 'derive_address_test.dart';

void main() {
  test('Contract Parameter Encoding', () {
    final trc20TransferContract = TronTRC20TransferContractData(
      recipient: tronAddress1,
      ownerAddress: tronAddress,
      contractAddress: tronUSDTAddress,
      amount: Amount(value: 1.toBigInt, decimals: 6),
    );

    expect(trc20TransferContract.functionSignature.toHex, "a9059cbb");

    print(trc20TransferContract.data.toHex);

    final decodedParams = decodeParams(
      trc20TransferContract.data,
      [
        TronParameterType.ADDRESS,
        TronParameterType.INT256,
      ],
    );

    final address = decodedParams[0] as TronAddressParameter;
    final amount = decodedParams[1] as TronIntParameter;

    expect(address.value, tronAddress1);
    expect(amount.value, 1.toBigInt);
  });
}
