import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'contract_generator.dart';

Builder contractBuilder(BuilderOptions options) {
  print('========== CONTRACT BUILDER FACTORY CALLED ==========');
  return SharedPartBuilder(
    [ContractGenerator()],
    "g",
  );
}
