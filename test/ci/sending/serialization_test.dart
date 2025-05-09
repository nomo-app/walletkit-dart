/// TODO: Maybe reimplemnt this test. Bute because this is covered in the whole Transaction Simulation, this is not necessary.

void main() {
  // test("Output Serialization", () {
  //   final address = "1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa";
  //   final outpout = buildOutput(address, BigInt.one);

  //   final hexRepresentation = outpout.toHex();

  //   expect(
  //     hexRepresentation,
  //     "010000000000000076a91462e907b15cbf27d5425399ebf6f0fb50ebb88f1888ac",
  //   );
  // });

  // test("Input Serialization", () {
  //   var input = buildInput(
  //     "",
  //     {},
  //     ElectrumOutput(
  //       scriptPubKey: ElectrumScriptPubKey(
  //         hexString:
  //             P2Hash("1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa").publicKeyScriptHash,
  //       ),
  //       value: BigInt.one,
  //       n: 0,
  //     ),
  //   );

  //   input = input.copyWith(
  //     scriptSig: Uint8List.fromList(
  //       hex.decode(
  //         "30450221008949f0cb400094ad2b5eb399d59d01c14d73d8fe6e96df1a7150deb388ab8935022079656090d7f6bac4c9a94e0aad311a4268e082a725f8aeae0573fb12ff866a5f01",
  //       ),
  //     ),
  //   );

  //   final hexRepresentation = input.toHex();

  //   expect(
  //     hexRepresentation,
  //     "010000000000000076a91462e907b15cbf27d5425399ebf6f0fb50ebb88f1888ac",
  //   );
  // });
}
