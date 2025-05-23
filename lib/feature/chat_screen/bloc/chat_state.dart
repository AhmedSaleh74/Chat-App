part of 'chat_bloc.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatSuccess extends ChatState {
  final List<Message> messages;
  ChatSuccess({required this.messages});
}

final class ChatFailure extends ChatState {
  final String errorMessage;
  ChatFailure({required this.errorMessage});
}
