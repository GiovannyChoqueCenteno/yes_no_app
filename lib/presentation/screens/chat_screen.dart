import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_field.dart';
import 'package:provider/provider.dart';
import '../widgets/chat/her_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://steamuserimages-a.akamaihd.net/ugc/2020473056479992612/DD290AB3E5647956C9C8A8C5855BE165C8AF7164/?imw=5000&imh=5000&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false"),
          ),
        ),
        title: const Text("Ejemplo"),
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.message.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.message[index];
                  return (message.fromWho == FromWho.mine)
                      ? MyMessageBubble(
                          message: message,
                        )
                      : HerMessageBuble(
                          message: message,
                        );
                },
              ),
            ),
            MyMessageField(onValue: chatProvider.sendMessage)
          ],
        ),
      ),
    );
  }
}
