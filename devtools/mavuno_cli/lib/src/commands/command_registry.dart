import 'command.dart';

class CommandRegistry {
  final Map<String, Command> _commands = {};

  void register(Command command) {
    _commands[command.name] = command;
  }

  Command? find(String name) {
    return _commands[name];
  }

  Iterable<Command> get commands => _commands.values;
}
