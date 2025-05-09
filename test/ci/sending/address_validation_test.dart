import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  test('empty addresses', () {
    expect(validateAddress(address: "", token: zeniqCoin), AddressError.INVALID);
    expect(validateAddress(address: "", token: ethNative), AddressError.INVALID);
    expect(
      validateAddress(address: "  ", token: zeniqCoin),
      AddressError.WHITESPACE,
    );
    expect(
      validateAddress(address: "  ", token: ethNative),
      AddressError.WHITESPACE,
    );
  });

  test('address validations ZENIQ UTXO', () {
    const coin = zeniqCoin;
    expect(
      validateAddress(address: "mUy497jumJB1E5RqRJAhBni3TzJMdrboKa", token: coin),
      null,
    );
    expect(
      validateAddress(address: "mAy497jumJB1E5RqRJAhBni3TzJMdrboKa", token: coin),
      AddressError.INVALID_CHECKSUM,
    );
    expect(
      validateAddress(address: "  mUy497jumJB1E5RqRJAhBni3TzJMdrboKa ", token: coin),
      AddressError.WHITESPACE,
    );
    expect(
      validateAddress(address: "garbageaddress", token: coin),
      AddressError.INVALID,
    );
    expect(
      validateAddress(address: "0x05870f1507d820212E921e1f39f14660336231D1", token: coin),
      AddressError.WRONG_CHAIN,
    );
    expect(
      validateAddress(address: "18M1XkiCXdfu7RWjg7avPXFtgAEeCtkn6Q", token: coin),
      AddressError.WRONG_CHAIN,
    );
    expect(
      validateAddress(address: "35bSzXvRKLpHsHMrzb82f617cV4Srnt7hS", token: coin),
      AddressError.WRONG_CHAIN,
    );
    expect(
      validateAddress(address: "bc1qdf6dj0ux6p459mkd8e7x6q2ny0436xfg8xnvr9", token: coin),
      AddressError.WRONG_CHAIN,
    );

    expect(
      validateAddress(
          address: "bitcoincash:qp0qu5dhyug828caegpnu5zg48k7elfywq494pje3x", token: coin),
      AddressError.WRONG_CHAIN,
    );
  });

  test('address validations BTC', () {
    const coin = btcCoin;
    expect(
      validateAddress(address: "18M1XkiCXdfu7RWjg7avPXFtgAEeCtkn6Q", token: coin),
      null,
    );
    expect(
      validateAddress(address: "18M1XkiDXdfu7RWjg7avPXFtgAEeCtkn6Q", token: coin),
      AddressError.INVALID_CHECKSUM,
    );
    expect(
      validateAddress(address: "  18M1XkiCXdfu7RWjg7avPXFtgAEeCtkn6Q ", token: coin),
      AddressError.WHITESPACE,
    );
    expect(
      validateAddress(address: "garbageaddress", token: coin),
      AddressError.INVALID,
    );
    expect(
      validateAddress(address: "0x05870f1507d820212E921e1f39f14660336231D1", token: coin),
      AddressError.WRONG_CHAIN,
    );
    expect(
      validateAddress(address: "mUy497jumJB1E5RqRJAhBni3TzJMdrboKa", token: coin),
      AddressError.WRONG_CHAIN,
    );
    expect(
      validateAddress(address: "35bSzXvRKLpHsHMrzb82f617cV4Srnt7hS", token: coin),
      null,
    );
    expect(
      validateAddress(address: "bc1qdf6dj0ux6p459mkd8e7x6q2ny0436xfg8xnvr9", token: coin),
      null,
    );
    expect(
      validateAddress(
          address: "bitcoincash:qp0qu5dhyug828caegpnu5zg48k7elfywq494pje3x", token: coin),
      AddressError.WRONG_CHAIN,
    );
  });

  test('address validations LTC', () {
    const coin = ltcCoin;
    expect(validateAddress(address: "LQWQYndDLpq2MKNeaCtnpAta8MDhUjr9g2", token: coin), null);
    expect(
      validateAddress(address: "LQWQYndDLpq2MKNeaCtnpAta8MDhUjr9g3", token: coin),
      AddressError.INVALID_CHECKSUM,
    );
    expect(
      validateAddress(address: "  LQWQYndDLpq2MKNeaCtnpAta8MDhUjr9g2 ", token: coin),
      AddressError.WHITESPACE,
    );
    expect(
      validateAddress(address: "garbageaddress", token: coin),
      AddressError.INVALID,
    );
    expect(
      validateAddress(address: "18M1XkiCXdfu7RWjg7avPXFtgAEeCtkn6Q", token: coin),
      AddressError.WRONG_CHAIN,
    );
    expect(
      validateAddress(address: "0x05870f1507d820212E921e1f39f14660336231D1", token: coin),
      AddressError.WRONG_CHAIN,
    );
    expect(
      validateAddress(address: "mUy497jumJB1E5RqRJAhBni3TzJMdrboKa", token: coin),
      AddressError.WRONG_CHAIN,
    );
    expect(
      validateAddress(address: "35bSzXvRKLpHsHMrzb82f617cV4Srnt7hS", token: coin),
      AddressError.WRONG_CHAIN,
    );
    expect(
      validateAddress(address: "bc1qdf6dj0ux6p459mkd8e7x6q2ny0436xfg8xnvr9", token: coin),
      AddressError.WRONG_CHAIN,
    );
    expect(
      validateAddress(
          address: "bitcoincash:qp0qu5dhyug828caegpnu5zg48k7elfywq494pje3x", token: coin),
      AddressError.WRONG_CHAIN,
    );

    expect(
      validateAddress(address: "MTcnkd11rPmucGsZb2bfqsdcWqtntoJoAc", token: coin),
      null,
    );

    expect(
        validateAddress(address: "ltc1q9ltm9d5mz7kl4p3hl9c2m55x448u3cvawljcyz", token: coin), null);
  });

  test('address validations BCH', () {
    const coin = bchCoin;
    expect(
      validateAddress(address: "18M1XkiCXdfu7RWjg7avPXFtgAEeCtkn6Q", token: coin),
      null,
    );
    expect(
      validateAddress(address: "18M1XkiCXdfu7RWjg7avPXFtgAEeCtkn6L", token: coin),
      AddressError.INVALID_CHECKSUM,
    );
    expect(
      validateAddress(address: "  18M1XkiCXdfu7RWjg7avPXFtgAEeCtkn6Q ", token: coin),
      AddressError.WHITESPACE,
    );
    expect(
      validateAddress(address: "garbageaddress", token: coin),
      AddressError.INVALID,
    );
    expect(
      validateAddress(address: "LQWQYndDLpq2MKNeaCtnpAta8MDhUjr9g2", token: coin),
      AddressError.WRONG_CHAIN,
    );
    expect(
      validateAddress(address: "0x05870f1507d820212E921e1f39f14660336231D1", token: coin),
      AddressError.WRONG_CHAIN,
    );
    expect(
      validateAddress(address: "mUy497jumJB1E5RqRJAhBni3TzJMdrboKa", token: coin),
      AddressError.WRONG_CHAIN,
    );
    expect(
      validateAddress(address: "35bSzXvRKLpHsHMrzb82f617cV4Srnt7hS", token: coin),
      null,
    );
    expect(
      validateAddress(address: "bc1qdf6dj0ux6p459mkd8e7x6q2ny0436xfg8xnvr9", token: coin),
      AddressError.WRONG_CHAIN,
    );
    expect(
      validateAddress(
          address: "bitcoincash:qp0qu5dhyug828caegpnu5zg48k7elfywq494pje3x", token: coin),
      null,
    );
  });

  test('address validations ETH', () {
    _addressValidationsEVM(ethNative);
  });

  test('address validations ZENIQ Smartchain', () {
    _addressValidationsEVM(zeniqSmart);
  });

  test('address validations ZEN20', () {
    _addressValidationsEVM(avinocZSC);
  });

  test('address validations ERC20', () {
    _addressValidationsEVM(avinocETH);
  });
}

void _addressValidationsEVM(CoinEntity coin) {
  expect(validateAddress(address: "0x05870f1507d820212E921e1f39f14660336231D1", token: coin), null);
  expect(
      validateAddress(
          address: "0x05870f1507d820212E921e1f39f14660336231D124".toLowerCase(), token: coin),
      AddressError.INVALID); // length must be 42
  expect(
      validateAddress(
          address: "0x05870f1507d820212E921e1f39f140336231D1".toLowerCase(), token: coin),
      AddressError.INVALID); // length must be 42
  expect(validateAddress(address: "0x058D0A1507d820212E921e1f39f14660336231D1", token: coin),
      AddressError.INVALID_CHECKSUM); // mixed case must contain a checksum
  expect(
      validateAddress(
          address: "0x058D0A1507d820212E921e1f39f14660336231D1".toLowerCase(), token: coin),
      null); // lowercase does not contain a checksum
  expect(
    validateAddress(address: "  0x05870f1507d820212E921e1f39f14660336231D1 ", token: coin),
    AddressError.WHITESPACE,
  );
  expect(
    validateAddress(address: "garbageaddress", token: coin),
    AddressError.INVALID,
  );
  expect(
    validateAddress(address: "mUy497jumJB1E5RqRJAhBni3TzJMdrboKa", token: coin),
    AddressError.WRONG_CHAIN,
  );
  expect(
    validateAddress(address: "18M1XkiCXdfu7RWjg7avPXFtgAEeCtkn6Q", token: coin),
    AddressError.WRONG_CHAIN,
  );
  expect(
    validateAddress(address: "35bSzXvRKLpHsHMrzb82f617cV4Srnt7hS", token: coin),
    AddressError.WRONG_CHAIN,
  );
  expect(
    validateAddress(address: "bc1qdf6dj0ux6p459mkd8e7x6q2ny0436xfg8xnvr9", token: coin),
    AddressError.WRONG_CHAIN,
  );
  expect(
    validateAddress(address: "bitcoincash:qp0qu5dhyug828caegpnu5zg48k7elfywq494pje3x", token: coin),
    AddressError.WRONG_CHAIN,
  );
}
