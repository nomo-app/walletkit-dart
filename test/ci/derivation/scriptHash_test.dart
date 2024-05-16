import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/utxo/payments/p2h.dart';
import 'package:walletkit_dart/src/crypto/utxo/pubkey_to_address.dart';
import 'package:walletkit_dart/src/domain/repository/endpoint_utils.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  test('Bitcoin Compatibility', () async {
    /// Bitcoin Compatibility
    final publicKeyScript = P2Hash(
      "3A7hx2vwkFcZ4ECnaBzJ5pezMEKABdoUFK",
    ).publicKeyScript.toHex;

    expect(publicKeyScript, "a9145c6c66afe0972b0269229453c1db465fe24cd40d87");
  });

  test("Test ScriptHash for Multiple Addresses", () {
    /// Bitcoin Segwit
    var publicKeyScript = P2Hash(
      "bc1qnays69laz86xuk9fwmgh8mkr5jylvgyqe30vkn",
    ).publicKeyScript.toHex;

    var publicKeyScriptHash = P2Hash(
      "bc1qnays69laz86xuk9fwmgh8mkr5jylvgyqe30vkn",
    ).publicKeyScriptHash;

    print(publicKeyScriptHash);

    expect(publicKeyScript, "00149f490d17fd11f46e58a976d173eec3a489f62080");

    var witness =
        "03e6ff629277ef58ac35c6ba6b7e285960837e9b30b5dedc4c96d5e26772fb4d43";

    final address =
        pubKeyHexToAddress(witness, AddressType.segwit, BitcoinNetwork);

    expect(address, "bc1qnays69laz86xuk9fwmgh8mkr5jylvgyqe30vkn");

    /// Bitcoin Legacy
    publicKeyScript = P2Hash(
      "1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa",
    ).publicKeyScript.toHex;

    expect(
      publicKeyScript,
      "76a91462e907b15cbf27d5425399ebf6f0fb50ebb88f1888ac",
    );

    /// Bitcoin Compatibility
    publicKeyScript = P2Hash(
      "3A7hx2vwkFcZ4ECnaBzJ5pezMEKABdoUFK",
    ).publicKeyScript.toHex;

    expect(publicKeyScript, "a9145c6c66afe0972b0269229453c1db465fe24cd40d87");
  });

  test("Bitcoin P2SH Script Hash", () {
    const hashedPublicKeyHex = "c02d3ae0c920004a03b69f27795c5f2867a883a2";

    final address = pubKeyHexToAddress(
      hashedPublicKeyHex,
      AddressType.compatibility,
      BitcoinNetwork,
    );

    expect(address, "3KD9r1YSr6LCSsCg9na9HBp7bNdn5fCvUb");
  });

  test('script hash ZENIQ', () {
    // example from https://zeniq.net/address/mR5Uc35F7s18MpcG8FWR7i9KWqKuPoyutb
    var hash = P2Hash("mR5Uc35F7s18MpcG8FWR7i9KWqKuPoyutb");

    var scriptHash = hash.publicKeyScriptHash;

    var publicKeyScript = hash.publicKeyScript.toHex;

    expect(
      publicKeyScript,
      "76a914619cb9bf04e72b6355c5e44131c972d7997dd83d88ac",
    );

    expect(
      scriptHash,
      "08548a9aac7dccef7e1afdcbda802ded42b27a080883d1add37ac04efb475369",
    );

    hash = P2Hash("mR5Uc35F7s18MpcG8FWR7i9KWqKuPoyutb");

    scriptHash = hash.publicKeyScriptHash;

    publicKeyScript = hash.publicKeyScript.toHex;

    expect(
      publicKeyScript,
      "76a914619cb9bf04e72b6355c5e44131c972d7997dd83d88ac",
    );

    expect(
      scriptHash,
      "08548a9aac7dccef7e1afdcbda802ded42b27a080883d1add37ac04efb475369",
    );

    hash = P2Hash("meQjXjkMFcfk6WA6G614HEwbk9ynCDjMCd");

    scriptHash = hash.publicKeyScriptHash;

    publicKeyScript = hash.publicKeyScript.toHex;

    expect(
      publicKeyScript,
      "76a914f3dab93991e820517bd30ba055497f05be24fa2888ac",
    );

    expect(
      scriptHash,
      "bdff1840ec3613f96cb200f70db24c606a7f51a4c34fbffb8b6090eef7509149",
    );

    hash = P2Hash("mevhZnNQHx9uiBqMiM5mL1XAvey2Ne5q78");

    scriptHash = hash.publicKeyScriptHash;

    publicKeyScript = hash.publicKeyScript.toHex;

    expect(
      publicKeyScript,
      "76a914f9858ff3667750f9289d9616578b429ba6e78bf588ac",
    );

    expect(
      scriptHash,
      "43f2a1e5dc076a9e8aa8c7e4f955da68be94077e70443870e91351445e31e2cc",
    );
  });

  test('Litecoin Script Hashes', () async {
    final scriptHash = P2Hash("ltc1q9ltm9d5mz7kl4p3hl9c2m55x448u3cvawljcyz")
        .publicKeyScriptHash;
    var publicKeyScript = P2Hash("ltc1q9ltm9d5mz7kl4p3hl9c2m55x448u3cvawljcyz")
        .publicKeyScript
        .toHex;

    expect(
      scriptHash,
      "c87378987f49363cba7508f22b65f311afadc22dd2cf9b6ed8b72c9ebd907f79",
    );

    expect(
      publicKeyScript,
      "00142fd7b2b69b17adfa8637f970add286ad4fc8e19d",
    );

    final (result, _, _) = await fetchFromRandomElectrumXNode(
      (client) => client.getHistory(scriptHash),
      endpoints: LitecoinNetwork.endpoints,
      client: null,
      token: LitecoinNetwork.coin,
    );

    expect(result, isNotEmpty);

    publicKeyScript =
        P2Hash("LSdTvMHRm8sScqwCi6x9wzYQae8JeZhx6y").publicKeyScript.toHex;

    expect(
        publicKeyScript, "76a914513b3458ac325869b6146b92c59b530207493c1588ac");

    publicKeyScript =
        P2Hash("MTcnkd11rPmucGsZb2bfqsdcWqtntoJoAc").publicKeyScript.toHex;

    expect(publicKeyScript, "a914d849ee1d7081507b2c3432dbe83a4cb8eaaeb12c87");
  });
}
