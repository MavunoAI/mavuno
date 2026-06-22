import 'command_registry.dart';
import 'command_result.dart';

class CommandBus {
  const CommandBus(this.registry);

  final CommandRegistry registry;

  Future<CommandResult> execute(String command, List<String> arguments) async {
    final handler = registry.find(command);

    if (handler == null) {
      return const CommandResult(exitCode: 1, message: 'Unknown command.');
    }

    return handler.execute(arguments);
  }
}
