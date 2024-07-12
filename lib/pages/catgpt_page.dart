import 'package:catflix/services/api_service.dart';
import 'package:flutter/material.dart';

import '../models/message_model.dart';

class CatgptPage extends StatefulWidget {
  const CatgptPage({super.key});

  @override
  State<CatgptPage> createState() => _CatgptPageState();
}

class _CatgptPageState extends State<CatgptPage> {
  final List<MessageModel> _messages = [];
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    if (_textController.text.isNotEmpty) {
      String userText = _textController.text;
      setState(() {
        _messages.add(MessageModel(
          text: userText,
          isUserMessage: true,
        ));
        _messages.add(MessageModel(
          text: 'Loading...',
          isUserMessage: false,
          isLoading: true,
        ));
        _textController.clear();
      });

      var response = await ApiService().fetchApi(userText);
      // ignore: unnecessary_null_comparison
      if (response != null) {
        setState(() {
          _messages.removeLast();
          _messages.add(MessageModel(
            text: response,
            isUserMessage: false,
            isLoading: false,
          ));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return message.isUserMessage
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            message.text,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    : Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: message.isLoading
                              ? const CircularProgressIndicator()
                              : Text(
                                  message.text,
                                  style: const TextStyle(color: Colors.black),
                                ),
                        ),
                      );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onSubmitted: (value) {
                      _sendMessage();
                    },
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Type your message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
