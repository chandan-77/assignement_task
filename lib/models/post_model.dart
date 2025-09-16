class PostModel {
  final int id;
  final String title;
  final String body;
  bool isRead;
  int duration;

  PostModel({
    required this.id,
    required this.title,
    required this.body,
    this.isRead = false,
    required this.duration,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      isRead: json['isRead'] ?? false,
      duration: json['duration'] ?? 20,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'body': body,
    'isRead': isRead,
    'duration': duration,
  };
}
