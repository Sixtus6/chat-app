class ChatRoom {
  int id;
  String lastMessage;
  List<String> members;
  String topic;
  int modifiedAt;

  ChatRoom({
    required this.id,
    required this.lastMessage,
    required this.members,
    required this.topic,
    required this.modifiedAt,
  });

  factory ChatRoom.fromJson(Map<String, dynamic> json) => ChatRoom(
        id: json["id"].toInt(),
        lastMessage: json["last_message"],
        members: List<String>.from(json["members"].map((x) => x)),
        topic: json["topic"] ?? "N/A",
        modifiedAt: json["modified_at"].toInt(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "last_message": lastMessage,
        "members": List<dynamic>.from(members.map((x) => x)),
        "topic": topic,
        "modified_at": modifiedAt,
      };
}
