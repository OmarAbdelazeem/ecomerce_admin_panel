import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_tut/src/core/utils/localization/picked_time_type.dart';
import 'package:ecommerce_admin_tut/src/core/utils/utils/date_time_util.dart';
import 'package:ecommerce_admin_tut/src/models/banner_model.dart';
import 'package:ecommerce_admin_tut/src/models/customer_model.dart';
import 'package:ecommerce_admin_tut/src/models/main_category_model.dart';
import 'package:ecommerce_admin_tut/src/models/name_field_model.dart';
import 'package:ecommerce_admin_tut/src/models/product_model.dart';
import 'package:ecommerce_admin_tut/src/models/sub_category_model.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:flutter/cupertino.dart';

class FirestoreRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future? addBanner(BannerModel banner) async {
    await firestore.collection('banners').doc(banner.id).set(banner.toJson());
  }

  Future addCustomers(CustomerModel customerModel)async{
   await firestore.collection('customers').doc().set(customerModel.toJson());
  }

  // Future updateCustomer()async{
  //   await firestore.collection('users').doc('mIHsd398GK6D6wLtJzIY').update({'name':'M'});
  // }
  //
  // Future deleteCustomer()async{
  //   await firestore.collection('users').doc('mIHsd398GK6D6wLtJzIY').delete();
  // }

  Future<List<QueryDocumentSnapshot>> fetchBanners() async {
    final docs = (await firestore.collection('banners').get()).docs;
    return docs;
  }

  Stream<QuerySnapshot> searchForOrder(int orderNumber){
   final ordersDocs =  firestore.collection('orders').where('orderNumber' , isEqualTo: orderNumber).get().asStream();
   return ordersDocs;
  }

  Future updateBannerImage(String bannerId, String image) async {
    await firestore
        .collection('banners')
        .doc(bannerId)
        .update({'image': image});
  }

  Future updateBannerSwitchValue(String bannerId, bool value) async {
    print('bannerId is $bannerId');
    print('value is $value');
    await firestore
        .collection('banners')
        .doc(bannerId)
        .update({'is_opened': value});
  }

  Stream<Iterable<QueryDocumentSnapshot>> fetchNotBannerProducts(
      NameField bannerName) {
    final productsRef = firestore.collection("products").limit(20);

    var query =
        productsRef.snapshots().map((snapshot) => snapshot.docs.where((doc) {
              List banners = doc['banners'];

              final map = bannerName.toJson();

              final banner =
                  banners.where((element) => element['en'] == map!['en']);

              return banner.isEmpty ? true : false;
            }));

    return query;
  }

  Future<List<QueryDocumentSnapshot>> getSubCategories(
      String categoryId) async {
    return (await firestore
            .collection('subCategories')
            .where('main_category_id', isEqualTo: categoryId)
            .get())
        .docs;
  }

  Future addBannerProduct(String productId, NameField banner) async {
    await firestore.collection('products').doc(productId).update({
      'banners': FieldValue.arrayUnion([banner.toJson()])
    });
  }

  Future removeBannerProduct(String productId, NameField banner) async {
    await firestore.collection('products').doc(productId).update({
      'banners': FieldValue.arrayRemove([banner.toJson()])
    });
  }

  // Future checkFun(Map <String,dynamic>test)async{
  //  final doc = await firestore.collection('products').doc('e998b599-7008-47b5-a5a3-dd28315bc379').update({'banners':FieldValue.arrayRemove([test])});
  //  // print(doc.docs[0].data());
  // }

  // Future updateProductField(
  //     {required dynamic value,required String id,required String? fieldName}) async {
  //   print('value is $value , id is $id , fieldName is $fieldName');
  //   await firestore.collection('products').doc(id).update({fieldName!: value});
  // }

  _fetchOrdersOfOneDay(DateTime date, {String? status}) {
    final ordersRef = firestore.collection("orders").limit(20);
    final previousDay = date.subtract(Duration(
      seconds: 1,
    ));
    final nextDay = date.add(Duration(hours: 24));

    var query =
        ordersRef.snapshots().map((snapshot) => snapshot.docs.where((doc) {
              DateTime orderDate = DateTime.parse(doc["ordered_at"]);

              bool dateCondition = unifyDateFormat(previousDay)
                      .isBefore(unifyDateFormat(orderDate)) &&
                  unifyDateFormat(nextDay).isAfter(unifyDateFormat(orderDate));
              if (status != null) {
                bool statusCondition = status == doc['order_status'];
                return dateCondition && statusCondition;
              } else
                return dateCondition;
            }));

    query.listen((Iterable event) {
      print('event.length is ${event.length}');

      event.forEach((element) {
        print(element.data());
      });
    });

    return query;
  }

  // Future getStatistics(
  //     {bool thisYear = false,
  //     bool thisMonth = false,
  //     bool thisDay = false,
  //     bool allYears = false,
  //     bool allMonths = false,
  //     bool lastThirtyDays = false}) async {
  //   var analyticsRef = firestore.collection('statistics');
  //   var allDaysRef = analyticsRef.doc('calendar').collection('days');
  //   var analyticsData;
  //   final date = DateTime.now();
  //   // Query query = allDaysRef;
  //
  //   try {
  //     if (thisDay) {
  //       analyticsData = (await allDaysRef.doc().get());
  //     } else if (lastThirtyDays) {
  //       final currentYear = DateTime.now().year;
  //       final currentMonth = DateTime.now().month;
  //       final currentDay = DateTime.now().day;
  //       final nowUtc = DateTime.utc(currentYear, currentMonth, currentDay, 0);
  //       final lastDateId = nowUtc.subtract(Duration(days: 7)).toIso8601String();
  //
  //       var documentSnapshot = await allDaysRef.doc(lastDateId).get();
  //
  //       print('documentSnapshot data is ${documentSnapshot.data()}');
  //       analyticsData = (await allDaysRef
  //           .orderBy('id')
  //           .limit(18)
  //           .startAfterDocument(documentSnapshot)
  //           .get());
  //     } else {
  //       analyticsData = (await analyticsRef.doc('total').get()).data();
  //     }
  //     return analyticsData;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future getStatistics({
    PickedTimeType pickedTimeType = PickedTimeType.total,
    String? dateId,
  }) async {
    var statisticsRef = firestore.collection('statistics');
    DocumentSnapshot statisticsData;
    try {
      switch (pickedTimeType) {
        case PickedTimeType.day:
          statisticsData = await statisticsRef
              .doc('calendar')
              .collection('days')
              .doc(dateId)
              .get();
          break;
        case PickedTimeType.month:
          statisticsData = await statisticsRef
              .doc('calendar')
              .collection('months')
              .doc(dateId)
              .get();
          break;
        case PickedTimeType.total:
          statisticsData = await statisticsRef.doc('total').get();
          break;
      }
      return statisticsData.data();
    } catch (e) {
      print(e);
    }
  }

  Stream<DocumentSnapshot> fetchOrderDetails(String id) {
    final orderData = firestore
        .collection('orders')
        .doc(id)
        .collection('details')
        .doc('details')
        .snapshots();
    return orderData;
  }

  Stream<QuerySnapshot> searchForProduct(String productName) {
    Stream<QuerySnapshot> products = firestore
        .collection("products")
        .where("name_search", arrayContains: productName)
        .get()
        .asStream();

    return products;
  }

  Future getCustomerAnalytics(String customerId) async {
    final docs = (await firestore
            .collection('users')
            .doc(customerId)
            .collection('analytics')
            .get())
        .docs;
    return docs;
  }

  Future deleteMainCategory(String id) async {
    final docRef = firestore.collection('mainCategories').doc(id);
    final doc = await docRef.get();
    if (doc.exists) {
      await docRef.delete();
    }
  }

  // end of analytics functions

  Stream getAllOrders(
      {@required String? statusCondition,
      @required String? sortingCondition,
      DateTime? date,
      bool descending = false}) {
    var ordersQuerySnapshot;
    final ordersRef = firestore.collection("orders").limit(20);
    var query;
    // if (id != null) {
    //   query = _firestore
    //       .collection("users")
    //       .doc(id)
    //       .collection('orders')
    //       .limit(20)
    //       .orderBy("ordered_at");
    // }
    // else {

    if (statusCondition != null && date == null) {
      query = ordersRef
          .where('order_status', isEqualTo: statusCondition)
          .orderBy('$sortingCondition', descending: descending);
      ordersQuerySnapshot = query.snapshots();
    } else if (date != null && statusCondition == null) {
      ordersQuerySnapshot = _fetchOrdersOfOneDay(date);
    } else if (date != null && statusCondition != null) {
      ordersQuerySnapshot = _fetchOrdersOfOneDay(date, status: statusCondition);
    } else {
      query = ordersRef.orderBy('$sortingCondition', descending: descending);
      ordersQuerySnapshot = query.snapshots();
    }

    // }

    return ordersQuerySnapshot;
  }

  // Stream<QuerySnapshot> getAllOrders([id]) {
  //   Stream<QuerySnapshot> ordersQuerySnapshot;
  //   // var query;
  //   // if (id != null) {
  //   //   query = _firestore
  //   //       .collection("users")
  //   //       .doc(id)
  //   //       .collection('orders')
  //   //       .limit(20)
  //   //       .orderBy("ordered_at");
  //   // }
  //   // else {
  //   var query = _firestore.collection("orders").limit(20).orderBy("ordered_at",descending: true);
  //   // }
  //   ordersQuerySnapshot = query.snapshots();
  //
  //   return ordersQuerySnapshot;
  // }

  Future filterProducts(String field, String condition) async {
    List<DocumentSnapshot> documentList;
    var query;
    query = firestore
        .collection("products")
        .limit(20)
        .where(field, isEqualTo: condition);
    documentList = (await query.getDocuments())._documents;
    return documentList;
  }

  Future deleteProduct(String id) async {
    await firestore.collection('products').doc(id).delete();
  }

  Stream<QuerySnapshot> searchForCustomer(String customer) {
    // List<DocumentSnapshot> documentList;

    var query = firestore
        .collection("users")
        .where('name', isGreaterThanOrEqualTo: customer)
        .get()
        .asStream();
    // documentList = (await query.getDocuments())._documents;
    return query;
  }

  Future searchForCategory(String categoryName) async {
    List<DocumentSnapshot> documentList;
    var query;
    query = firestore
        .collection("categories")
        .where('name', isGreaterThanOrEqualTo: categoryName);
    documentList = (await query.getDocuments())._documents;
    return documentList;
  }

  Future updateOrderStatus(String status, String orderId,
      [int? orderNumber]) async {
    final orderRef = firestore.collection('orders').doc(orderId);
    Map updatedData = orderNumber != null
        ? {'order_status': status, 'order_number': orderNumber}
        : {'order_status': status};

    await orderRef.update(Map.from(updatedData));

    await orderRef
        .collection('details')
        .doc('details')
        .update(Map.from(updatedData));
  }

  Future<int> getOrderNumber(String orderId) async {
    var totalData =
        (await firestore.collection('analytics').doc('total').get()).data();
    int orderNumber = totalData!['orders'] + 1;

    return orderNumber;
  }

  Future<List<QueryDocumentSnapshot>> getNotifications() async {
    return (await firestore.collection('notification').get()).docs;
  }

  Future<List<ProductModel>> getProductsData(String condition) async {
    List<DocumentSnapshot> docList = (await firestore
            .collection("products")
            .where(condition, isEqualTo: true)
            .get())
        .docs;
    return List.generate(docList.length, (index) {
      return ProductModel.fromJson(docList[index].data());
    });
  }

  Future updateMainCategoryName(String name, String id, bool isEnglish) async {
    var categoryRef = firestore.collection('mainCategories').doc(id);
    return isEnglish
        ? await categoryRef.update({"name.en": name})
        : await categoryRef.update({"name.ar": name});
  }

  Future updateProduct(
      {required Map<String, dynamic> field, required String id}) async {
    final productsRef = firestore.collection('products').doc(id);
    try {
      await productsRef.update(field);
    } catch (e) {
      print(e);
    }
  }


  Future addSubCategory(SubCategoryModel subCategory) async {
    await firestore
        .collection('subCategories')
        .doc(subCategory.id)
        .set(subCategory.toJson());
  }

  Future deleteSubCategory(String id) async {
    return await firestore.collection('subCategories').doc(id).delete();
  }

  Future deleteBanner(String id) async {
    return await firestore.collection('banners').doc(id).delete();
  }

  Future updateSubCategory({
    required String id,
    required Map<String, dynamic> field,
  }) async {
    await firestore.collection('subCategories').doc(id).update(field);
  }

  Future updateBanner({
    required String id,
    required Map<String, dynamic> field,
  }) async {
    await firestore.collection('banners').doc(id).update(field);
  }

  Future<List<QueryDocumentSnapshot>> getCustomersData() async {
    final usersRef = await firestore.collection("users").get();
    final usersDocs = usersRef.docs;
    return usersDocs;
  }

  Future<DocumentSnapshot> getCustomerInfo(String id) async {
    final userDoc = await firestore.collection("users").doc(id).get();
    return userDoc;
  }

  Future<List<QueryDocumentSnapshot>> getCustomerOrders(
      String customerId) async {
    final ordersDoc = (await firestore
            .collection("users")
            .doc(customerId)
            .collection('orders')
            .get())
        .docs;
    return ordersDoc;
  }

  Future<void> uploadProduct(ProductModel product) async {
    await firestore
        .collection('products')
        .doc(product.productId)
        .set(Map.from(product.toJson()));
  }

  Future<void> uploadMainCategory(MainCategoryModel category) async {
    await firestore
        .collection('mainCategories')
        .doc(category.id)
        .set(Map.from(category.toJson()));
  }

  Future getMainCategories() async {
    QuerySnapshot data = await firestore.collection('mainCategories').get();
    return data.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBannerProducts(Map banner) async {
    late List<QueryDocumentSnapshot<Map<String, dynamic>>> productsDocuments;
    var productsRef = firestore.collection('products');
    // String orderCondition;

    return (await productsRef.where('banners', arrayContains: banner).get())
        .docs;
    // if (condition == StringsConstants.topSellingProducts) {
    //   orderCondition = 'sold_quantity';
    //   // Todo remember to modify this
    //   productsDocuments = (await productsRef
    //           .limit(20)
    //           .orderBy(orderCondition, descending: true)
    //           .get())
    //       .docs;
    // } else if (condition == StringsConstants.dealOfTheDay) {
    //   orderCondition = 'is_deal_of_the_day';
    //   productsDocuments = (await productsRef
    //           .limit(20)
    //           .where(orderCondition, isEqualTo: true)
    //           .get())
    //       .docs;
    // } else if (condition == StringsConstants.whatIsNew) {
    //   orderCondition = 'date';
    //   productsDocuments = (await productsRef
    //           .limit(20)
    //           .orderBy(orderCondition, descending: true)
    //           .get())
    //       .docs;
    // }
    /*
     // if condition is top_products
    get descending by number of sales

     */
    /*
    // else if condition is deal of the day
       get by has discount


     */

    /*
    * // else if condition is what is new
    * get by the date of product
    *
    * */

    // return productsDocuments;
  }

  Future<List<DocumentSnapshot>> getProducts(
      {DocumentSnapshot? documentSnapshot,
      String? sortCondition,
      Map? filterCondition,
      bool isUnCategorized = false,
      bool descending = false}) async {
    List<DocumentSnapshot> documentList;
    final productsRef = firestore.collection('products').limit(20);

    print('sortCondition is $sortCondition');
    print('filterCondition is $filterCondition');
    print('isUnCategorized is $isUnCategorized');
    print('descending is $descending');

    Query query;

    // 1- filter condition
    if (filterCondition != null) {
      query = sortCondition != null
          ? productsRef.orderBy(sortCondition, descending: descending).where(
              filterCondition['key'],
              arrayContains: filterCondition['value'])
          : productsRef.where(filterCondition['key'],
              arrayContains: filterCondition['value']);
    } else if (isUnCategorized) {
      query = sortCondition != null
          ? productsRef
              .where('sub_category', isNull: true)
              .orderBy(sortCondition, descending: descending)
          : productsRef.where('sub_category', isNull: true);
    } else {
      query = sortCondition != null
          ? productsRef.orderBy(sortCondition, descending: descending)
          : productsRef;
    }

    documentList = documentSnapshot != null
        ? (await query.startAfterDocument(documentSnapshot).get()).docs
        : (await query.get()).docs;

    return documentList;
  }
}
// we should work on discount price
// if admin does not add discount then it should equal to actual price
// discount price cannot be greater than actual price
