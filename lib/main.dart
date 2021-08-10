import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/ui/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AppInjector.create();
  // Bloc.observer = MyBlocObserver();

  runApp(App());
}


// final firestoreRepo = getItInstance<FirestoreRepository>();
// firestoreRepo.addCustomers(CustomerModel(name: 'test',id: '1247895',
//     phoneNumber: '01065545',
//     addresses: [
//       Address(name: 'test',
//           pincode: '545',
//           address: 'test',
//           city: 'test',
//           state: 'test',
//           phoneNumber: 'test')
//     ],
//     date: 'test'));