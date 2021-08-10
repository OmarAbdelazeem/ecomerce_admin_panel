import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/customer_model.dart';
import 'package:ecommerce_admin_tut/src/repository/algolia_repository.dart';
import 'package:ecommerce_admin_tut/src/repository/firestore_repository.dart';
import 'customers_state.dart';

class CustomersCubit extends Cubit<CustomersState> {
  CustomersCubit() : super(CustomersState.idle());

  var _firestoreRepo = getItInstance<FirestoreRepository>();
  var _algoliaRepo = getItInstance<AlgoliaRepository>();

  List<CustomerModel> _customersList = [];

  fetchCustomers() async {
    emit(CustomersState.loading());

    try {
      List customersDocs = await _firestoreRepo.getCustomersData();

      _customersList = List<CustomerModel>.generate(customersDocs.length,
          (index) => CustomerModel.fromJson(customersDocs[index].data()));

      emit(CustomersState.customersLoaded(_customersList));
    } catch (e) {
      print(e);
      emit(CustomersState.error(e.toString()));
    }
  }

  searchForCustomer(String ? customerName) async {

    try {
      if(customerName !=null && customerName.isNotEmpty){
        if(_trimSearchName(customerName).isNotEmpty){
          emit(CustomersState.loading());
          _algoliaRepo.searchForCustomer(customerName).listen((customer) {
            _customersList = List<CustomerModel>.generate(customer.hits.length,
                    (index) => CustomerModel.fromJson(customer.hits[index].data));
            emit(CustomersState.customersLoaded(_customersList));
          });
        }

      }
      else{
        emit(CustomersState.customersLoaded([]));
      }

    } catch (e) {
      print(e);
      emit(CustomersState.error(e.toString()));
    }
  }

  String _trimSearchName(String searchName){
   return searchName.trim().replaceFirst(RegExp(r'[^\w\s]+'), '');
  }

  fetchCustomerInfo(String id) async {
    emit(CustomersState.loading());
    try {
      final customerDoc = await _firestoreRepo.getCustomerInfo(id);
      emit(CustomersState.customerLoaded(
          CustomerModel.fromJson(customerDoc.data())));
    } catch (e) {
      emit(CustomersState.error(e.toString()));
    }
  }

}
