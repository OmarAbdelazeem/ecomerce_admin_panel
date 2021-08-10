import 'package:bloc/bloc.dart';
import 'package:ecommerce_admin_tut/src/core/utils/localization/picked_time_type.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/statistics_model.dart';
import 'package:ecommerce_admin_tut/src/repository/firestore_repository.dart';

import 'admin_statistics_state.dart';

class AdminStatisticsCubit extends Cubit<AdminStatisticsState> {
  AdminStatisticsCubit() : super(AdminStatisticsState.idle());
  final firestoreRepo = getItInstance<FirestoreRepository>();

  void getStatistics(
      {PickedTimeType pickedTimeType = PickedTimeType.total,
      DateTime? selectedTime}) async {
    var analyticsData;
    late StatisticsModel statistics;
    emit(AdminStatisticsState.loading());
    try {
      if (selectedTime != null) {
        analyticsData = await firestoreRepo.getStatistics(
            dateId: DateTime.utc(
                    selectedTime.year, selectedTime.month, selectedTime.day, 00)
                .toIso8601String(),
            pickedTimeType: pickedTimeType);
      } else
        analyticsData =
            await firestoreRepo.getStatistics(pickedTimeType: pickedTimeType);
      print(analyticsData);
      if (analyticsData == null)
        statistics = StatisticsModel(selectedTime!, 0, 0, 0, 0, 0, 0);
      else
        statistics = StatisticsModel.fromJson(analyticsData);
      emit(AdminStatisticsState.loaded(statistics));
    } catch (e) {
      print(e);
      emit(AdminStatisticsState.error(e.toString()));
    }
  }

}
