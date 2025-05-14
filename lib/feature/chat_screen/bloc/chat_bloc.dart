import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../core/constant/constant.dart';
import '../models/message_model.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final List<Message> messagesList = [];
  final CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  ChatBloc() : super(ChatInitial()) {
    on<ChatEvent>((event, emit) async {
      if (event is SendMessageEvent) {
        try {
          await messages.add({
            kMessage: event.message,
            kCreatedAt: DateTime.now(),
            kEmail: event.email,
          });
          emit(ChatSuccess(messages: messagesList));
        } catch (e) {
          emit(ChatFailure(errorMessage: e.toString()));
        }
      }
      if (event is ReceiveMessageEvent) {
        try {
          messages.orderBy(kCreatedAt).snapshots().listen((event) {
            messagesList.clear();
            for (var doc in event.docs) {
              messagesList.add(Message.fromJson(doc));
            }
            add(InternalMessagesUpdatedEvent());
          });
        } catch (e) {
          emit(ChatFailure(errorMessage: e.toString()));
        }
      }
      if (event is InternalMessagesUpdatedEvent) {
        emit(ChatSuccess(messages: List.from(messagesList)));
      }
    });
  }
}
