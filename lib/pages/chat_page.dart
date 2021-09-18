import 'dart:io';

import 'package:chat/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  List<ChatMessage> _messages = [
    ChatMessage(text: "Hola mundo", uid: "123"),
    ChatMessage(text: "Hola mundo", uid: "123"),
    ChatMessage(text: "Como estas", uid: "1234"),
    ChatMessage(text: "Como estas", uid: "1234"),
    ChatMessage(text: "Hoy", uid: "123"),
    ChatMessage(text: "Hoy", uid: "123"),
    ChatMessage(text: "Ahora", uid: "1234"),
  ];

  bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(children: [
          CircleAvatar(
            child: Text("Te", style: TextStyle(fontSize: 12)),
            backgroundColor: Colors.blue[100],
            maxRadius: 14,
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "Melissa Flores",
            style: TextStyle(color: Colors.black87, fontSize: 12),
          )
        ]),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
          child: Column(
        children: [
          Flexible(
              child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: _messages.length,
            itemBuilder: (_, i) => _messages[i],
            reverse: true,
          )),
          Divider(
            height: 1,
          ),
          Container(
            color: Colors.white,
            height: 60,
            child: _inputChat(),
          )
        ],
      )),
    );
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      child: Row(
        children: [
          Flexible(
              child: TextField(
            controller: _textController,
            onSubmitted: _handleSubmit,
            onChanged: (String texto) {
              setState(() {
                if (texto.trim().length > 0) {
                  _estaEscribiendo = true;
                } else {
                  _estaEscribiendo = false;
                }
              });
            },
            decoration: InputDecoration.collapsed(hintText: "Enviar mensaje"),
            focusNode: _focusNode,
          )),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 4.0,
            ),
            child: Platform.isIOS
                ? CupertinoButton(
                    child: Text("Enviar"),
                    onPressed: _estaEscribiendo
                        ? () => _handleSubmit(_textController.text)
                        : null,
                  )
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconTheme(
                      data: IconThemeData(color: Colors.blue[400]),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: Icon(
                          Icons.send,
                        ),
                        onPressed: _estaEscribiendo
                            ? () => _handleSubmit(_textController.text)
                            : null,
                      ),
                    ),
                  ),
          )
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
    ));
  }

  _handleSubmit(String texto) {
    print(texto);
    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = ChatMessage(text: texto, uid: "123");
    _messages.insert(0, newMessage);

    setState(() {
      _estaEscribiendo = false;
    });
  }
}
