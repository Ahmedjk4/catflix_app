
class MessageModel {
  final String text;
  final bool isUserMessage;
  final bool isLoading;

  MessageModel({
    required this.text,
    required this.isUserMessage,
    this.isLoading = false,
  });
}
