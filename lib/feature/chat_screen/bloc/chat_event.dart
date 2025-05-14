part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent {}

class SendMessageEvent extends ChatEvent {
  final String email;
  final String message;
  SendMessageEvent({required this.message, required this.email});
}

class ReceiveMessageEvent extends ChatEvent {}

class InternalMessagesUpdatedEvent extends ChatEvent {}
