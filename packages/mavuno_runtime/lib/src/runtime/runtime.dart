import '../chat/chat_request.dart';
import '../chat/chat_response.dart';
import '../chat/chat_runtime_session.dart';
import '../chat/chat_service.dart';

import '../generation/generation_request.dart';
import '../generation/generation_result.dart';
import '../generation/generator.dart';

/// Public entry point into the Mavuno runtime.
///
/// Consumers (CLI, Flutter, desktop, benchmarks)
/// should only interact with this class.
final class Runtime {
  const Runtime({required Generator generator, required ChatService chatService})
    : _generator = generator,
      _chatService = chatService;

  final Generator _generator;

  final ChatService _chatService;

  /// Generates tokens for a prompt using the configured runtime.
  GenerationResult generate(GenerationRequest request) {
    return _generator.generate(request);
  }

  /// Executes a conversational chat turn.
  ChatResponse chat({required ChatRuntimeSession session, required ChatRequest request}) {
    return _chatService.chat(session: session, request: request);
  }
}
