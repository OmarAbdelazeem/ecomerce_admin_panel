import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ecommerce_admin_tut/src/models/notification_model.dart';
part 'notifications_state.freezed.dart';

@freezed
abstract class NotificationsState with _$NotificationsState {
  const factory NotificationsState.idle() = Idle;

  const factory NotificationsState.loading() = Loading;

  const factory NotificationsState.loaded(
      List<NotificationModel> notifications) = Loaded;

  const factory NotificationsState.error(String error) = Error;
}
