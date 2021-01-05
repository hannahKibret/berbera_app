class Notification {
  String id;
  String message;
  String message_type;
  String created;

  Notification({this.id, this.message, this.message_type, this.created});

  Notification.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    message_type = json['message_type'];
    created = json['created'];
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> json = new Map<String, dynamic>();

    json['id'] = this.id;
    json['message_type'] = this.message_type;
    json['message'] = this.message;
    json['created'] = this.created;

    return json;
  }
}
