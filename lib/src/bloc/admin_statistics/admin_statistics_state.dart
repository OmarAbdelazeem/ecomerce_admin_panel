import 'package:ecommerce_admin_tut/src/models/statistics_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_statistics_state.freezed.dart';


@freezed
abstract class AdminStatisticsState with _$AdminStatisticsState{
  const factory AdminStatisticsState.idle() = Idle;
  const factory AdminStatisticsState.loading() = Loading;
  const factory AdminStatisticsState.loaded(statistics) = Loaded;

  const factory AdminStatisticsState.error(String e) = Error;
}


