class Welcome {
  int id;
  int chatId;
  String sender;
  String message;
  int modifiedAt;

  Welcome({
    required this.id,
    required this.chatId,
    required this.sender,
    required this.message,
    required this.modifiedAt,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
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
