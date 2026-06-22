import 'dart:io';

import 'package:mavuno_cli/mavuno_cli.dart';

Future<void> main(List<String> arguments) async {
  final kernel = CliKernel();

  final exitCode = await kernel.run(arguments);

  exit(exitCode);
}
