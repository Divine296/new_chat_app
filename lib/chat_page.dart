import 'package:new_chat_app/widgets/chat_bubble.dart';
import 'package:new_chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'models/ chat_message_entity.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  List<ChatMessageEntity> _messages = [
    ChatMessageEntity(
        author: Author(userName: 'Divine'),
        createdAt: 21452315,
        id: '1',
        text: 'Wazzup!'
    ),
    ChatMessageEntity(
      author: Author(userName: 'Divine'),
      createdAt: 21452315,
      id: '1',
      text: 'Hey yo!',
      imageUrl:  'https://upload.wikimedia.org/wikipedia/commons/0/0f/Grosser_Panda.JPG',
    ),
    ChatMessageEntity(
      author: Author(userName: 'Jewel'),
      createdAt: 21452315,
      id: '1',
      text: 'Gottchaaa',
    ),
  ];

  @override
  Widget build(BuildContext context) {

    final username = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Hi $username!'),
        actions: [
          IconButton(
              onPressed: () {

                Navigator.pushReplacementNamed(context, '/');
                print('Icon pressed!');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index){
                  return ChatBubble(
                      alignment: _messages[index].author.userName == 'Divine'
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      entity: _messages[index]);
                }
            ),
          ),
          ChatInput(),
        ],
      ),
    );
  }
}