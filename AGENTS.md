# Repository Guidelines

## Project Structure & Module Organization
- `lib/`: Package source entry `walletkit_dart.dart` plus modules under `src/` (EVM, UTXO, Tron, wallet utils, domain entities, utils).
- `test/`: Organized by domain (e.g., `test/ci/evm`, `test/ci/fetching`, `test/ci/tron`). `ci-mocked/` holds tests with mocks; `no_ci/` are local-only.
- `example/`: Minimal CLI helpers and usage snippets.
- `protos/`: Protocol definitions; generated Dart files live in `lib/src/crypto/tron/repositories/rpc/`.
- `coverage/`: Local/CI coverage outputs.

## Build, Test, and Development Commands
- Prereqs: Dart SDK `^3.7.2` (see `pubspec.yaml`).
- Install deps: `dart pub get`
- Static analysis: `dart analyze`
- Format code: `dart format .`
- Run all tests: `dart test`
- Run a test subset: `dart test test/ci/evm`
- Generate coverage (local):
  - `dart pub global activate coverage`
  - `dart test --coverage=coverage`
  - `dart pub global run coverage:format_coverage --lcov --in=coverage --out=coverage/lcov.info --package=. --report-on=lib`

## Coding Style & Naming Conventions
- Style: Dart `package:lints/recommended` (see `analysis_options.yml`).
- Indentation: 2 spaces; max line length per Dart defaults.
- Naming: types in `UpperCamelCase`, methods/vars in `lowerCamelCase`, files in `lower_snake_case.dart`.
- Keep public API exports centralized in `lib/walletkit_dart.dart`.

## Testing Guidelines
- Framework: `package:test` with domain-focused directories.
- Name tests after subject and behavior: `feature_action_test.dart`.
- Prefer deterministic tests; use `ci-mocked` for network-sensitive paths.
- Env for integration tests: uses `.env` via `dotenv`. Common keys: `ETHERSCAN_API_KEYS`, `TRONSCAN_API_KEYS`, `DEV_SEED`, `REJECT_SEED`, `TRON_SEED`. Do not commit secrets.

## Commit & Pull Request Guidelines
- Commits: prefer Conventional Commits (`feat:`, `fix:`, `refactor:`, `test:`, `chore:`). Keep changes scoped and descriptive.
- PRs should include:
  - Purpose and summary of changes; link related issues.
  - Notes on API surface changes (exports in `walletkit_dart.dart`).
  - Test coverage: list added/updated tests and how to run a focused subset.
  - Screenshots/trace snippets when debugging protocol/tx parsing.

## Security & Configuration Tips
- Secrets: store locally in `.env`; CI uses repository secrets. Never log private keys or seeds.
- When adding new RPC/backends, gate keys via `dotenv` and add mocked tests under `test/ci-mocked`.
