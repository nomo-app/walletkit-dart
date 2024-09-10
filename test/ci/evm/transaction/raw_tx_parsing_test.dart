import 'dart:typed_data';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/evm/transaction/raw_evm_transaction.dart';
import 'package:walletkit_dart/src/domain/extensions.dart';
import 'package:walletkit_dart/src/utils/int.dart';

void main() {
  test(
    "Type 0 (Legacy) Parsing and Sender Recovery",
    () {
      // https://etherscan.io/tx/0x970775cba3b9426385d60606c26100b887715d70b3a499ee641f90d867650954
      const messageHex =
          "0xf86c80852086c4d50082520894a5dfaeec681f3b99a7e731e4bf519211bb80826e880111973db95280008026a01850da03edb23764ea4666a0a54c0b86d291a870de29c4a4c14b6d7eb810f2dda061d4d6909dff254cb5327f9209688178b5494345893d206d9679ee73a8222cdf";

      var tx = RawEvmTransaction.fromHex(messageHex);

      expect(tx, isA<RawEVMTransactionType0>());
      tx = tx as RawEVMTransactionType0;
      expect(tx.nonce, 0.toBI);
      expect(tx.value, 77008960000000000.toBI);
      expect(tx.gasLimit, 21000.toBI);
      expect(tx.gasPrice, 139700000000.toBI);
      expect(tx.data, Uint8List(0));
      expect(tx.to, "0xa5DFAeec681f3B99a7e731E4BF519211bB80826e".toLowerCase());
      expect(tx.chainId, 1);
      expect(
        tx.sender,
        "0x0FEE80018f60E6980460523B9Bf156AeCA71AD9E".toLowerCase(),
      );
      expect(
        tx.txHash,
        "0x970775cba3b9426385d60606c26100b887715d70b3a499ee641f90d867650954",
      );

      final reparsedTx = RawEvmTransaction.fromHex(tx.serialized.toHex);
      expect(reparsedTx, tx);
    },
  );

  test("Type 1 Tx", () {
    // https://etherscan.io/tx/0xe44ca6688ff544c783aa72ab9f32f1def8636cfd053014481a48f8dee99927a0
    const messageHex =
        "0x01f8a401268501a1889fb682642994a7fa4bb0bba164f999e8c7b83c9da96a3be4461685e8d4a5100080f838f794a7fa4bb0bba164f999e8c7b83c9da96a3be44616e1a0000000000000000000000000000000000000000000000000000000000000000080a09a915ca74a79f4bb4110cb5a29c50be70bccd540e1334b80aacf981954faf7aba06d4533388e20d666d6c413af001353267fa23125eaac37fb686402cc6d873d7b";

    var tx = RawEvmTransaction.fromHex(messageHex);
    expect(tx, isA<RawEVMTransactionType1>());
    tx = tx as RawEVMTransactionType1;

    expect(tx.nonce, 38.toBI);
    expect(tx.value, 1000000000000.toBI);
    expect(tx.gasLimit, 25641.toBI);
    expect(tx.gasPrice, 7005052854.toBI);
    expect(tx.to, "0xA7Fa4bB0bba164F999E8C7B83C9da96A3bE44616".toLowerCase());
    expect(tx.data, Uint8List(0));
    expect(tx.chainId, 1);
    expect(
      tx.accessList.first.address,
      "0xA7Fa4bB0bba164F999E8C7B83C9da96A3bE44616".toLowerCase(),
    );
    expect(
      tx.accessList.first.storageKeys.first,
      "0000000000000000000000000000000000000000000000000000000000000000"
          .toLowerCase(),
    );
    expect(
      tx.txHash,
      "0xe44ca6688ff544c783aa72ab9f32f1def8636cfd053014481a48f8dee99927a0",
    );
    expect(
      tx.sender,
      "0xA7Fa4bB0bba164F999E8C7B83C9da96A3bE44616".toLowerCase(),
    );

    final reparsedTx = RawEvmTransaction.fromHex(tx.serialized.toHex);
    expect(reparsedTx, tx);
  });

  test("Type 2 Tx", () {
    // https://etherscan.io/tx/0xa9b44a108284d837402e511603af1172ae23e4f577f511a6dc9884abe460095c
    const messageHex =
        "0x02f909d2018244be830f4240845c3f24628316701c944315f344a905dc21a08189a117efd6e1fca37d5780b90964131ea36a000000000000000000000000b770fdfe8b7f39306d92f2883059275fe86ddd39000000000000000000000000dac17f958d2ee523a2206206994597c13d831ec7000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000aa0840b95cf33e8dad82624697e8e85791c06cad000000000000000000000000000000000000000000000000000000000bb9893b000000000000000000000000000000000000000000000000012e562d54a9575c00000000000000000000000000000000000000000000000000000000000001400000000000000000000000000000000000000000000000000000000000000019000000000000000000000000000000000000000000000000000000000000493e000000000000000000000000000000000000000000000000000000000000062000000000000000000000000000000000000000000000000000000000000004a403b87e5f0000000000000000000000000000000000000000000000000000000000018795000000000000000000000000aa0840b95cf33e8dad82624697e8e85791c06cad000000000000000000000000dac17f958d2ee523a2206206994597c13d831ec7000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000000000000000000000000000000000000bb9893b000000000000000000000000000000000000000000000000012e9486c10a8d800000000000000000000000000000000000000000000000000000000066de9a800000000000000000000000000000000000000000000000000000000000000140000000000000000000000000000000000000000000000000000000000000018000000000000000000000000000000000000000000000000000000000000004800000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000bb9893b000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000000000000000000000e000000000000000000000000000000000000000000000000000000000000001200000000000000000000000000000000000000000000000000000000000000160000000000000000000000000dac17f958d2ee523a2206206994597c13d831ec70000000000000000000000000000000000000000000000000000000000000001000000000000000000000000cbd78f8fb96bae40826a601f8b9ba17782d625270000000000000000000000000000000000000000000000000000000000000001000000000000000000000000cbd78f8fb96bae40826a601f8b9ba17782d6252700000000000000000000000000000000000000000000000000000000000000018000000000000000000027106ca298d2983ab03aa1da7679389d955a4efee15c0000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000060000000000000000000000000dac17f958d2ee523a2206206994597c13d831ec7000000000000000000000000c02aaa39b223fe8d0a0e5c4f27ead9083c756cc200000000000000000000000000000000000000000000000000000000000001f4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000500000000000000000000000000000000000000000000000000000000000000a0000000000000000000000000000000000000000000000000000000000000012000000000000000000000000000000000000000000000000000000000000001a0000000000000000000000000000000000000000000000000000000000000022000000000000000000000000000000000000000000000000000000000000002a00000000000000000000000000000000000000000000000000000000000000041b455f40f4ec1bf9937a281431eb0b5d1114e19670ddafff157f06f92ffecbd711d00f4c7be9e2506bfa6734b718d1cbbe1cd41b5de554f58d5d5ca2b8726061d1c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000041d6db3c1997d0836ea54063708405ad75088dcced93c15e5feaff3b23ab4c0c51336034245884135208769c534414614b26ca327f26da7ff3baa959633ea102941c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004118164432fae3f99b91748115391a58bd25d521e18f91d2c0301970d0e2ed92334fa411a8f3456884d92ef6128b84774cf6b5e308ab642ea496f55373966210241b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000041a00d9bcd5c0d8f1b1d6a2381743ceb38d6fdd56fbb426fdd211fdc610426afc96d18751c0f662ad7b65549ab24edda185b6fa90b7d9a9acee4855939972abbbd1c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000041c704aaefb18ee98253fbd0f508eb263b2505f3f4462aab6ec2e3573a4276f53620e74cc9a60952b79ef19004b78b75ff53e11b1d2f7b5229145a15984bb1e9c21c00000000000000000000000000000000000000000000000000000000000000c001a0dd5c93c0a9ce8b8fb2dd75002a806a9af93c8a0095625c016ac79a7568d0696ea03c1de4c733ddfece33d486bcefb7cc914f626d5b4f0522d50b63430145d8568b";

    var tx = RawEvmTransaction.fromHex(messageHex);
    expect(tx, isA<RawEVMTransactionType2>());
    tx = tx as RawEVMTransactionType2;

    expect(tx.nonce, 17598.toBI);
    expect(tx.chainId, 1);
    expect(tx.value, 0.toBI);
    expect(tx.gasLimit, 1470492.toBI);

    expect(tx.to, "0x4315f344a905dC21a08189A117eFd6E1fcA37D57".toLowerCase());
    expect(
      tx.data.toHex,
      "131ea36a000000000000000000000000b770fdfe8b7f39306d92f2883059275fe86ddd39000000000000000000000000dac17f958d2ee523a2206206994597c13d831ec7000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000aa0840b95cf33e8dad82624697e8e85791c06cad000000000000000000000000000000000000000000000000000000000bb9893b000000000000000000000000000000000000000000000000012e562d54a9575c00000000000000000000000000000000000000000000000000000000000001400000000000000000000000000000000000000000000000000000000000000019000000000000000000000000000000000000000000000000000000000000493e000000000000000000000000000000000000000000000000000000000000062000000000000000000000000000000000000000000000000000000000000004a403b87e5f0000000000000000000000000000000000000000000000000000000000018795000000000000000000000000aa0840b95cf33e8dad82624697e8e85791c06cad000000000000000000000000dac17f958d2ee523a2206206994597c13d831ec7000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000000000000000000000000000000000000bb9893b000000000000000000000000000000000000000000000000012e9486c10a8d800000000000000000000000000000000000000000000000000000000066de9a800000000000000000000000000000000000000000000000000000000000000140000000000000000000000000000000000000000000000000000000000000018000000000000000000000000000000000000000000000000000000000000004800000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000bb9893b000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000000000000000000000e000000000000000000000000000000000000000000000000000000000000001200000000000000000000000000000000000000000000000000000000000000160000000000000000000000000dac17f958d2ee523a2206206994597c13d831ec70000000000000000000000000000000000000000000000000000000000000001000000000000000000000000cbd78f8fb96bae40826a601f8b9ba17782d625270000000000000000000000000000000000000000000000000000000000000001000000000000000000000000cbd78f8fb96bae40826a601f8b9ba17782d6252700000000000000000000000000000000000000000000000000000000000000018000000000000000000027106ca298d2983ab03aa1da7679389d955a4efee15c0000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000060000000000000000000000000dac17f958d2ee523a2206206994597c13d831ec7000000000000000000000000c02aaa39b223fe8d0a0e5c4f27ead9083c756cc200000000000000000000000000000000000000000000000000000000000001f4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000500000000000000000000000000000000000000000000000000000000000000a0000000000000000000000000000000000000000000000000000000000000012000000000000000000000000000000000000000000000000000000000000001a0000000000000000000000000000000000000000000000000000000000000022000000000000000000000000000000000000000000000000000000000000002a00000000000000000000000000000000000000000000000000000000000000041b455f40f4ec1bf9937a281431eb0b5d1114e19670ddafff157f06f92ffecbd711d00f4c7be9e2506bfa6734b718d1cbbe1cd41b5de554f58d5d5ca2b8726061d1c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000041d6db3c1997d0836ea54063708405ad75088dcced93c15e5feaff3b23ab4c0c51336034245884135208769c534414614b26ca327f26da7ff3baa959633ea102941c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004118164432fae3f99b91748115391a58bd25d521e18f91d2c0301970d0e2ed92334fa411a8f3456884d92ef6128b84774cf6b5e308ab642ea496f55373966210241b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000041a00d9bcd5c0d8f1b1d6a2381743ceb38d6fdd56fbb426fdd211fdc610426afc96d18751c0f662ad7b65549ab24edda185b6fa90b7d9a9acee4855939972abbbd1c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000041c704aaefb18ee98253fbd0f508eb263b2505f3f4462aab6ec2e3573a4276f53620e74cc9a60952b79ef19004b78b75ff53e11b1d2f7b5229145a15984bb1e9c21c00000000000000000000000000000000000000000000000000000000000000",
    );
    expect(tx.accessList, []);
    expect(tx.maxFeePerGas, 1547641954.toBI);
    expect(tx.maxPriorityFeePerGas, 1000000.toBI);
    expect(
      tx.txHash,
      "0xa9b44a108284d837402e511603af1172ae23e4f577f511a6dc9884abe460095c",
    );
    expect(
      tx.sender,
      "0xB35F9aAc007666caCD0520B68D59d682262db7Da".toLowerCase(),
    );

    final reparsedTx = RawEvmTransaction.fromHex(tx.serialized.toHex);
    expect(reparsedTx, tx);
  });
}