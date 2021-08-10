import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_choice_state.freezed.dart';

@freezed
abstract class ChartChoiceState with _$ChartChoiceState{
  const factory ChartChoiceState.users() = Users;
  const factory ChartChoiceState.totalIncome() = TotalIncome;
  const factory ChartChoiceState.orders() = Orders;
  const factory ChartChoiceState.cancelledOrders() = CancelledOrders;
  const factory ChartChoiceState.deliveredOrders() = DeliveredOrders;
  const factory ChartChoiceState.products() = Products;

}

