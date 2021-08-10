import 'package:bloc/bloc.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'chart_choice_state.dart';

class ChartChoiceCubit extends Cubit<ChartChoiceState> {
  ChartChoiceCubit() : super(ChartChoiceState.orders());
  late String _choice;

  void selectChartChoice(String choice) {
    _choice = choice;
    _checkChoice(choice);
  }

  _checkChoice(String choice) {
    switch (choice) {
      case StringsConstants.totalIncome:
        emit(ChartChoiceState.totalIncome());
        break;
      case StringsConstants.customers:
        emit(ChartChoiceState.users());
        break;
      case StringsConstants.deliveredOrders:
        emit(ChartChoiceState.deliveredOrders());
        break;
      case StringsConstants.canceledOrders:
        emit(ChartChoiceState.cancelledOrders());
        break;
      case StringsConstants.orders:
        emit(ChartChoiceState.orders());
        break;
      case StringsConstants.products:
        emit(ChartChoiceState.products());
        break;
    }
  }
}
