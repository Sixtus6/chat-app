class Welcome {
  int id;
  String lastMessage;
  List<String> members;
  String topic;
  int modifiedAt;

  Welcome({
    required this.id,
    required this.lastMessage,
    required this.members,
    required this.topic,
    required this.modifiedAt,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        lastMessage: json["last_message"],
        members: List<String>.from(json["members"].map((x) => x)),
        topic: json["topic"],
        modifiedAt: json["modified_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "last_message": lastMessage,
        "members": List<dynamic>.from(members.map((x) => x)),
        "topic": topic,
        "modified_at": modifiedAt,
      };
}
