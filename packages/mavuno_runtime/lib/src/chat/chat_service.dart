import 'chat_request.dart';
import 'chat_response.dart';
import 'chat_runtime_session.dart';

abstract interface class ChatService {
  ChatResponse chat({required ChatRuntimeSession session, required ChatRequest request});
}
