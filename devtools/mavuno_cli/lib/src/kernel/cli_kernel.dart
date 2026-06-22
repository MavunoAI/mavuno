import '../commands/command_bus.dart';
import '../commands/command_registry.dart';

class CliKernel {
  CliKernel() : registry = CommandRegistry();

  final CommandRegistry registry;

  late final CommandBus bus = CommandBus(registry);

  Future<int> run(List<String> arguments) async {
    if (arguments.isEmpty) {
      _printBanner();
      _printHelp();
      return 0;
    }

    final command = arguments.first;
    final result = await bus.execute(command, arguments.skip(1).toList());

    print(result.message);

    return result.exitCode;
  }

  void _printBanner() {
    print('''
Mavuno CLI
Version 0.1.0
Offline-first AI Platform
''');
  }

  void _printHelp() {
    print('''
Available Commands

doctor       (coming soon)
workspace    (coming soon)
new          (coming soon)
''');
  }
}
