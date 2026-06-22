import 'command_result.dart';

abstract interface class Command {
  String get name;

  String get description;

  Future<CommandResult> execute(List<String> arguments);
}
