@Timeout(Duration(seconds: 30))

import 'package:test/test.dart';
import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/payments/p2h.dart';
import 'package:walletkit_dart/src/crypto/utxo/utils/pubkey_to_address.dart';
import 'package:walletkit_dart/src/crypto/utxo/utils/endpoint_utils.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

final seed = helloSeed;

void main() {
  test('measure bip32 derivation performance', () {
    const c = EXTERNAL_CHAIN_INDEX;
    const purpose = HDWalletPurpose.NO_STRUCTURE;
    const t = ZeniqNetwork;
    const ePubKey =
        "xpub69QjKT4D1e67mdLGJDUq45wYdQZrVL7DATQ98dPPHiKwkKsrM1uyhbG4UazWemQvmi8GBV5UCpLGrFe8zUebtkw7Ew3bEKzv8bDPA2Difc8";

    final masterNode = deriveMasterNodeFromExtendedKeyWithCheck(
      ePubKey: ePubKey,
      networkType: t,
      purpose: purpose,
    );
    expect(
      deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: 0,
        networkType: t,
        walletPurpose: purpose,
        addressTypes: [AddressType.legacy],
      ).address,
      "mGDcPPDSnyJDKM7MzUTmFDwhaEHxFTEw1Q",
    );
    for (int i = 0; i < 1000; i++) {
      expect(
        deriveChildNode(
          masterNode: masterNode,
          chainIndex: c,
          index: i,
          networkType: ZeniqNetwork,
          walletPurpose: purpose,
          addressTypes: [AddressType.legacy],
        ).address,
        startsWith("m"),
      );
    }
  });

  test('derive external ZENIQ addresses from ePubKey', () {
    const c = EXTERNAL_CHAIN_INDEX;
    const purpose = HDWalletPurpose.NO_STRUCTURE;
    const t = ZeniqNetwork;
    const ePubKey =
        "xpub69QjKT4D1e67mdLGJDUq45wYdQZrVL7DATQ98dPPHiKwkKsrM1uyhbG4UazWemQvmi8GBV5UCpLGrFe8zUebtkw7Ew3bEKzv8bDPA2Difc8";
    final masterNode = deriveMasterNodeFromExtendedKeyWithCheck(
      ePubKey: ePubKey,
      networkType: t,
      purpose: purpose,
    );
    expect(
      deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: 0,
        networkType: t,
        walletPurpose: purpose,
        addressTypes: [AddressType.legacy],
      ).address,
      "mGDcPPDSnyJDKM7MzUTmFDwhaEHxFTEw1Q",
    );
    expect(
      deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: 1,
        networkType: t,
        walletPurpose: purpose,
        addressTypes: [AddressType.legacy],
      ).address,
      "mW96EYARiQNDe1fua5Bc1x9nhNg47JrbM2",
    );
    expect(
      deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: 2,
        networkType: t,
        walletPurpose: purpose,
        addressTypes: [AddressType.legacy],
      ).address,
      "mR4FAAi9v8MtJCiAVMtCu4MaTvhLFZofxf",
    );
  });

  test('derive external Bitcoin addresses from ePubKey', () {
    const c = EXTERNAL_CHAIN_INDEX;
    const t = BitcoinNetwork;
    const purpose = HDWalletPurpose.NO_STRUCTURE;
    const ePubKey =
        "xpub69QjKT4D1e67mdLGJDUq45wYdQZrVL7DATQ98dPPHiKwkKsrM1uyhbG4UazWemQvmi8GBV5UCpLGrFe8zUebtkw7Ew3bEKzv8bDPA2Difc8";
    final masterNode = deriveMasterNodeFromExtendedKeyWithCheck(
      ePubKey: ePubKey,
      networkType: t,
      purpose: purpose,
    );
    expect(
      deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: 0,
        networkType: t,
        walletPurpose: purpose,
        addressTypes: [AddressType.legacy],
      ).address,
      "113G5SRkh8KqMfmqJKphuS1ALjxC3ead3Z",
    );
    expect(
      deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: 1,
        networkType: t,
        walletPurpose: purpose,
        addressTypes: [AddressType.legacy],
      ).address,
      "1ExjvbNjcZPqgLLNsvYYgADFTtLHrwYivT",
    );
    expect(
      deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: 2,
        networkType: t,
        walletPurpose: purpose,
        addressTypes: [AddressType.legacy],
      ).address,
      "19strDvTpHPWLXNdoDF9ZGR3ESMa7NpXPw",
    );
  });

  test('derive multiple external ZENIQ addresses', () {
    const c = EXTERNAL_CHAIN_INDEX;
    const t = ZeniqNetwork;
    const type = bitcoinNSHDPath;
    final masterNode = deriveMasterNodeFromSeed(
      seed: helloSeed,
      networkType: t,
      walletPath: type,
    );
    expect(
      deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: 0,
        networkType: t,
        walletPurpose: type.purpose,
        addressTypes: [AddressType.legacy],
      ).address,
      "mVTbmKpr8JCrsfPFYHCYWw9TwgSArNDLoR",
    );
    expect(
      deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: 1,
        networkType: t,
        walletPurpose: type.purpose,
        addressTypes: [AddressType.legacy],
      ).address,
      "maqPxzXWCt1q5UmWn6XLjE3QJUNdHGkED4",
    );
    expect(
      deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: 2,
        networkType: t,
        walletPurpose: type.purpose,
        addressTypes: [AddressType.legacy],
      ).address,
      "mVGteJKnMiuep5wjj7FRp9JdftVNhV8QS7",
    );
    expect(
      deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: 3,
        networkType: t,
        walletPurpose: type.purpose,
        addressTypes: [AddressType.legacy],
      ).address,
      "mTU69gAgvG9UgerEQrj9TiFr9jkYhTjGfY",
    );
    expect(
      deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: 4,
        networkType: t,
        walletPurpose: type.purpose,
        addressTypes: [AddressType.legacy],
      ).address,
      "mQhMkrwU4oK69dmJbnFVnaqcdmuNNEvoTA",
    );

    expect(
      deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: 19,
        networkType: t,
        walletPurpose: type.purpose,
        addressTypes: [AddressType.legacy],
      ).address,
      "mbdqnzumEruGcnjMYssVDo74f1AGvzkEyX",
    );
  });

  test('derive multiple external BTC addresses', () {
    const c = EXTERNAL_CHAIN_INDEX;
    const t = BitcoinNetwork;
    const type = bitcoinNSHDPath;
    final masterNode = deriveMasterNodeFromSeed(
      seed: seed,
      networkType: t,
      walletPath: type,
    );
    expect(
      deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: 0,
        networkType: t,
        walletPurpose: type.purpose,
        addressTypes: [AddressType.legacy],
      ).address,
      "1EHFTP3A2TEUuz3ir8ZVB9CviC6Qh24Fvv",
    );
    expect(
      deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: 1,
        networkType: t,
        walletPurpose: type.purpose,
        addressTypes: [AddressType.legacy],
      ).address,
      "1Kf3f3jp733T7oRz5wtHPS6s4z2s2Jfkpi",
    );
    expect(
      deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: 2,
        networkType: t,
        walletPurpose: type.purpose,
        addressTypes: [AddressType.legacy],
      ).address,
      "1E6YLMY6FswGrQcD2xcNUMN6SQ9cREai2U",
    );
    expect(
      deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: 3,
        networkType: t,
        walletPurpose: type.purpose,
        addressTypes: [AddressType.legacy],
      ).address,
      "1CHjqjNzpRB6iyWhii667vKJvFQnRukXwD",
    );
    expect(
      deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: 4,
        networkType: t,
        walletPurpose: type.purpose,
        addressTypes: [AddressType.legacy],
      ).address,
      "19X1Sv9mxxLiBxRmudcSSnu5QHZcA6CtFH",
    );
  });

  test('derive multiple internal ZENIQ addresses', () {
    const c = INTERNAL_CHAIN_INDEX;
    const t = ZeniqNetwork;
    const type = bitcoinNSHDPath;
    final masterNode = deriveMasterNodeFromSeed(
      seed: seed,
      networkType: t,
      walletPath: type,
    );
    expect(
      deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: 0,
        networkType: t,
        walletPurpose: type.purpose,
        addressTypes: [AddressType.legacy],
      ).address,
      "mWS6NjWm1mdqWQMo39qeHwNpA3CxBC5rSa",
    );
    expect(
      deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: 1,
        networkType: t,
        walletPurpose: type.purpose,
        addressTypes: [AddressType.legacy],
      ).address,
      "mPYfRo9F7UG3Sujue31bvs74A8Wypf86LX",
    );
    expect(
      deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: 2,
        networkType: t,
        walletPurpose: type.purpose,
        addressTypes: [AddressType.legacy],
      ).address,
      "mGBPKm1gvMnbQyYBKMRBKUtNR4CY7yKDqc",
    );
  });

  test('derive multiple internal BTC addresses', () {
    const c = INTERNAL_CHAIN_INDEX;
    const t = BitcoinNetwork;
    const type = bitcoinNSHDPath;
    final masterNode = deriveMasterNodeFromSeed(
      seed: seed,
      networkType: t,
      walletPath: type,
    );
    expect(
      deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: 0,
        networkType: t,
        walletPurpose: type.purpose,
        addressTypes: [AddressType.legacy],
      ).address,
      "1FFk4nj4uvfTYj2GM1Cax9SGvYsC3Gp6A3",
    );
    expect(
      deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: 1,
        networkType: t,
        walletPurpose: type.purpose,
        addressTypes: [AddressType.legacy],
      ).address,
      "18NK7rMZ1dHfVEQNwtNYb5AWveBDYgvwAq",
    );
    expect(
      deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: 2,
        networkType: t,
        walletPurpose: type.purpose,
        addressTypes: [AddressType.legacy],
      ).address,
      "1131pDzpWpDTJCedCn7ygwqBZrmu4g6t4",
    );
  });

  test('pubKeyToAddress BTC', () {
    final address = pubKeyHexToAddress(
      "037c2ff309fbdfbc450daf7bfa8114d7d412e3ebbeea65ef47325f6a45593cf6a1",
      AddressType.legacy,
      BitcoinNetwork,
    );
    expect(address, "18M1XkiCXdfu7RWjg7avPXFtgAEeCtkn6Q");
  });

  test('pubKeyToAddress ZENIQ', () {
    final address = pubKeyHexToAddress(
      "037c2ff309fbdfbc450daf7bfa8114d7d412e3ebbeea65ef47325f6a45593cf6a1",
      AddressType.legacy,
      ZeniqNetwork,
    );
    expect(address, "mPXMqhVtdUeH56rGNGDyjKCRueaQTAFmhs");
  });

  test('pubKeyHashToAddress ZENIQ', () {
    final pubKeyHash = Uint8List.fromList(
      hex.decode("1ca0677f65c99dee3a0fbdc1134608203796dd39"),
    );
    final address =
        pubKeyHashToLegacyAddress(pubKeyHash, ZeniqNetwork.pubKeyHashPrefix);
    expect(address, "mJniPQGWnvTbugSUUA89981bd4n21WKw6C");
  });

  test('Derive First Litecoin Address', () async {
    final pubKey = Uint8List.fromList([
      2,
      108,
      108,
      60,
      96,
      112,
      119,
      235,
      107,
      30,
      209,
      130,
      135,
      96,
      243,
      56,
      230,
      57,
      31,
      224,
      241,
      38,
      96,
      78,
      253,
      252,
      149,
      66,
      143,
      171,
      13,
      236,
      58
    ]);
    final segwitAddress = pubKeyToAddress(
      pubKey,
      AddressType.segwit,
      LitecoinNetwork,
    );

    expect(segwitAddress, "ltc1q9ltm9d5mz7kl4p3hl9c2m55x448u3cvawljcyz");

    final legacyAddress = pubKeyToAddress(
      pubKey,
      AddressType.legacy,
      LitecoinNetwork,
    );

    expect(legacyAddress, "LPavRCJZ578h828Rqrpa96a1gVucA2c6kc");

    final scriptHash = P2Hash(segwitAddress).publicKeyScriptHash;

    print(scriptHash);

    final (result, _, _) = await fetchFromRandomElectrumXNode(
      (client) => client.getHistory(
        "c87378987f49363cba7508f22b65f311afadc22dd2cf9b6ed8b72c9ebd907f79",
      ),
      endpoints: LitecoinNetwork.endpoints,
      client: null,
      token: LitecoinNetwork.coin,
    );
    expect(result, isNotNull);
    expect(result!.length, greaterThanOrEqualTo(6));
  });

  test("Derive Litecoin Addresses", () async {
    const t = LitecoinNetwork;
    const purpose = HDWalletPurpose.BIP44;

    final masterNode = deriveMasterNodeFromExtendedKeyWithCheck(
      ePubKey: wkDebugXPUB,
      networkType: t,
      purpose: purpose,
    );
    for (var i = 0; i < 10; i++) {
      final addresses = deriveChildNode(
        masterNode: masterNode,
        chainIndex: EXTERNAL_CHAIN_INDEX,
        index: i,
        networkType: t,
        walletPurpose: purpose,
        addressTypes: [AddressType.segwit, AddressType.legacy],
      ).addresses;

      print(addresses);
    }

    for (var i = 0; i < 10; i++) {
      final addresses = deriveChildNode(
        masterNode: masterNode,
        chainIndex: INTERNAL_CHAIN_INDEX,
        index: i,
        networkType: t,
        walletPurpose: purpose,
        addressTypes: [AddressType.segwit, AddressType.legacy],
      ).addresses;

      print(addresses);
    }
  });
}
