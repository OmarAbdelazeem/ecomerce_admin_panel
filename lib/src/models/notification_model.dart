class NotificationModel {
 late String name;
 late String id;

  NotificationModel(this.name, this.id);

  NotificationModel.fromJson(json) {
    name = json['name'];
    id = json['id'];
  }
}
