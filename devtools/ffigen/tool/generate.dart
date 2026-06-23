import 'dart:io';

Future<void> main() async {
  final process = await Process.start('dart', const [
    'run',
    'ffigen',
    '--config',
    'ffigen.yaml',
  ], runInShell: true);

  await stdout.addStream(process.stdout);
  await stderr.addStream(process.stderr);

  final exitCode = await process.exitCode;

  if (exitCode != 0) {
    throw Exception('FFI generation failed (exit code $exitCode).');
  }

  print('✓ llama.cpp bindings generated successfully.');
}
