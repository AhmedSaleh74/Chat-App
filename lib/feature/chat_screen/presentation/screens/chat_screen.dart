import 'package:chat_app/core/constant/constant.dart';
import 'package:chat_app/feature/chat_screen/models/add_message.dart';
import 'package:chat_app/feature/chat_screen/presentation/widgets/chat_bubble_for_freind.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../models/message_model.dart';
import '../widgets/chat_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final AddMessage addMessage = AddMessage();
  final ScrollController scrollController = ScrollController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String email = Get.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: addMessage.messages.orderBy(kCreatedAt).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Message> messages = [];
            for (var doc in snapshot.data!.docs) {
              messages.add(Message.fromJson(doc));
            }
            // Scroll to bottom بعد ما العناصر ترندر
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (scrollController.hasClients) {
                scrollToBottom();
              }
            });
            return Scaffold(
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      kLogo,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    Text('Chat',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        controller: scrollController,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          return messages[index].email == email
                              ? ChatBubble(
                                  message: messages[index].message,
                                )
                              : ChatBubbleForFriend(
                                  message: messages[index].message);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextField(
                      onSubmitted: (data) {
                        if (messageController.text.isNotEmpty) {
                          addMessage.addMessage(
                              message: data, context: context, email: email);
                          messageController.clear();
                          scrollToBottom();
                        }
                      },
                      controller: messageController,
                      borderColor: kPrimaryColor,
                      textFieldSuffixIcon: Icons.send,
                      onPressSuffixIcon: () {
                        if (messageController.text.isNotEmpty) {
                          addMessage.addMessage(
                            message: messageController.text,
                            context: context,
                            email: email,
                          );
                          messageController.clear();
                          scrollToBottom();
                        }
                      },
                      hintText: 'Send Message',
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text("Something went wrong");
          } else {
            return Center(child: Text('Loading....'));
          }
        });
  }

  void scrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 100,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }
}
