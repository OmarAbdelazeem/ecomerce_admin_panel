import 'package:bloc/bloc.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/repository/firestore_repository.dart';
import 'package:ecommerce_admin_tut/src/models/notification_model.dart';
import 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsState.idle());
  final _firestoreRepo = getItInstance<FirestoreRepository>();

  void fetchNotifications() async {
    List<NotificationModel> notifications = [];
    emit(NotificationsState.loading());
    try {
      final notificationsDocs = await _firestoreRepo.getNotifications();
      notifications = List<NotificationModel>.generate(
          notificationsDocs.length,
              (index) =>
              NotificationModel.fromJson(notificationsDocs[index].data()));


      notifications.forEach((element) {
        print('element.name is ${element.name}');
      });
      emit(NotificationsState.loaded(notifications));
    } catch (e) {
      emit(NotificationsState.error(e.toString()));
    }
  }
}
