class ChatMessage {
  int id;
  int chatId;
  String sender;
  String message;
  int modifiedAt;

  ChatMessage({
    required this.id,
    required this.chatId,
    required this.sender,
    required this.message,
    required this.modifiedAt,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        id: json["id"],
        chatId: json["chat_id"],
        sender: json["sender"],
        message: json["message"],
        modifiedAt: json["modified_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chat_id": chatId,
        "sender": sender,
        "message": message,
        "modified_at": modifiedAt,
      };
}
