@Timeout(Duration(minutes: 5))
import 'dart:convert';

import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  test(
    "JSON Decoding & Serialization UTXO Transaction",
    () {
      const jsonString =
          '{"hash":"0eba034e28e083644ae8715fa287e07fd1217da8db31c77b3ad60c07b63dea74","block":-1,"confirmations":18882,"timeMilli":1716478740000,"amount":{"value":"7344","decimals":8},"fee":null,"sender":"19RmiXWEKMP7Kui5SwZryaqMp5GYyN1X5U","recipient":"1EbbYsUCyCXZzKU3z8T8MhTfRr26TGE7vt","transferMethod":2,"status":2,"id":"0eba034e28e083644ae8715fa287e07fd1217da8db31c77b3ad60c07b63dea74","version":1,"token":{"name":"Bitcoin","symbol":"BTC","decimals":8},"inputs":[{"scriptSig":"47304402206eac4ec833cdf7f5fe734e9576fc250bbd274ca33a713001e1aa017a8499a24a02206092e4c8773fab1078acf27cc2db628cba22e3b0d3e7e8938153dce16a6468b001210260e7b4a0437d1e462456516624fe9be7398749fc6f8521525a77047bb4d1f1eb","sequence":4294967295,"txid":"6672d4992928f11ff83aea95b2ede7da515dd52c23ed2ace1bdc418afa55343a","vout":1,"txinwitness":null,"coinbase":null},{"scriptSig":"47304402203a33f315c511634ba9d4817ec00cbca4b972a0a4d2c5122b4e10b3ac80ec150b0220271f45963408110cd1f74995e6608fd080132f70b272c05ef43312198b6c2e07012102a6cf69dcfc13e44e000b764791edef0c94147accde3598da1c110073a6af5198","sequence":4294967295,"txid":"6672d4992928f11ff83aea95b2ede7da515dd52c23ed2ace1bdc418afa55343a","vout":0,"txinwitness":null,"coinbase":null}],"outputs":[{"value":7344,"n":0,"spent":false,"belongsToUs":true,"scriptPubKey":{"hex":"76a91495249e4c0e1770eaf10cbcce8e6516b220702aba88ac","type":"pubkeyhash"},"node":{"type":0,"address":"1EbbYsUCyCXZzKU3z8T8MhTfRr26TGE7vt","derivationPath":"0/7","addresses":{"0":"1EbbYsUCyCXZzKU3z8T8MhTfRr26TGE7vt","1":"bc1qj5jfunqwzacw4ugvhn8guegkkgs8q2462nnv5v"},"walletPurpose":null,"publicKey":"028cd84211d2e108b63a5540da4ee55075af5edb323ef5bc0e2ad1ea6c18be2618"}},{"value":170141,"n":1,"spent":false,"belongsToUs":false,"scriptPubKey":{"hex":"76a914faa94de76e150140ed507dfa9af2d6ecd756c41188ac","type":"pubkeyhash"},"node":{"type":2}}]}';

      final decodedJson = jsonDecode(jsonString);

      final tx = UTXOTransaction.fromJson(decodedJson);

      expect(
        tx.hash,
        "0eba034e28e083644ae8715fa287e07fd1217da8db31c77b3ad60c07b63dea74",
      );

      final newJsonString = jsonEncode(tx.toJson());

      expect(newJsonString, jsonString);
    },
  );
}
