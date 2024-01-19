import 'dart:io';

import 'package:chat/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  bool _estaEscribiendo = false;
  List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Column(children: [
          CircleAvatar(
            backgroundColor: Colors.blueAccent,
            maxRadius: 14,
            child: Text('Te', style: TextStyle(fontSize: 12)),
          ),
          SizedBox(height: 3),
          Text('Melissa Flores',
              style: TextStyle(fontSize: 12, color: Colors.black87)),
        ]),
        centerTitle: true,
        elevation: 1,
      ),
      body: SizedBox(
        child: Column(children: [
          Flexible(
              child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: _messages.length,
            itemBuilder: (_, index) => _messages[index],
            reverse: true,
          )),
          const Divider(height: 1),
          _inputChat(),
        ]),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(children: [
          Flexible(
              child: TextField(
            controller: _textController,
            onSubmitted: _handleSubmit,
            onChanged: (String texto) {
              setState(() {
                _estaEscribiendo = texto.trim().isNotEmpty ? true : false;
              });
            },
            decoration: const InputDecoration.collapsed(
              hintText: 'Enviar mensaje',
            ),
            focusNode: _focusNode,
          )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Platform.isIOS
                ? CupertinoButton(
                    onPressed: () {},
                    child: const Text('Enviar'),
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconTheme(
                      data: IconThemeData(color: Colors.blue[400]),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: Icon(Icons.send, color: Colors.blue[400]),
                        onPressed: _estaEscribiendo
                            ? () => _handleSubmit(_textController.text.trim())
                            : null,
                      ),
                    )),
          ),
        ]),
      ),
    );
  }

  _handleSubmit(String texto) {
    if (texto.isEmpty) return;
    final newMessage = ChatMessage(
      texto: texto,
      uid: '123',
      animationController: AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 2000),
      ),
    );
    newMessage.animationController.forward();
    setState(() {
      _estaEscribiendo = false;
      _messages.insert(0, newMessage);
    });
    _focusNode.requestFocus();
    _textController.clear();
  }

  @override
  void dispose() {
    // TODO: off del socket

    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }

    super.dispose();
  }
}
