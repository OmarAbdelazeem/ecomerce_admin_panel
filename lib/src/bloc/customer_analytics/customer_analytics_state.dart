
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ecommerce_admin_tut/src/models/customer_analytics_item.dart';
part 'customer_analytics_state.freezed.dart';


@freezed
abstract class CustomerAnalyticsState with _$CustomerAnalyticsState{
  const factory CustomerAnalyticsState.idle() = Idle;
  const factory CustomerAnalyticsState.loading() = Loading;
  const factory CustomerAnalyticsState.loaded(List<CustomerAnalyticsModel> customerAnalyticsProducts) = Loaded;

}

