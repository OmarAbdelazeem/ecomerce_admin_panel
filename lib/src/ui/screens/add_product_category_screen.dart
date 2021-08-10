// import 'package:auto_route/auto_route.dart';
// import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
// import 'package:ecommerce_admin_tut/src/models/main_category_model.dart';
// import 'package:ecommerce_admin_tut/src/models/name_field_model.dart';
// import 'package:ecommerce_admin_tut/src/models/sub_category_model.dart';
// import 'package:ecommerce_admin_tut/src/notifiers/products_notifier.dart';
// import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
// import 'package:ecommerce_admin_tut/src/ui/common/choose_category.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:ecommerce_admin_tut/src/bloc/choose_category/choose_category.dart'
//     as choose_category;
// import 'package:ecommerce_admin_tut/src/bloc/edit_product/edit_product.dart'
//     as edit_product;
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class AddProductCategoriesField extends StatefulWidget {
//   final String productId;
//   final List<NameField> categories;
//
//   AddProductCategoriesField(
//       {required this.productId, required this.categories});
//
//   @override
//   _AddProductCategoriesFieldState createState() =>
//       _AddProductCategoriesFieldState();
// }
//
// class _AddProductCategoriesFieldState extends State<AddProductCategoriesField> {
//   final chooseCategoryCubit =
//       getItInstance<choose_category.ChooseCategoryCubit>();
//   final productsNotifier = getItInstance<ProductsNotifier>();
//   final editProductCubit = getItInstance<edit_product.EditProductCubit>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(StringsConstants.categories),
//         actions: [
//           IconButton(
//             onPressed: () {
//               if (widget.categories.isEmpty)
//                 editProductCubit.deleteProductCategory(widget.productId);
//               else {
//                 editProductCubit.updateProductCategory(widget.categories[0],
//                     widget.categories[1], widget.productId);
//               }
//             },
//             icon: Icon(Icons.check),
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: BlocBuilder<edit_product.EditProductCubit,
//             edit_product.EditProductState>(
//           bloc: editProductCubit,
//           builder: (context, state) {
//             if (state is edit_product.FieldUpdated) {
//               productsNotifier.updateProductValue(
//                   fieldName: StringsConstants.categories,
//                   value: widget.categories);
//               Future.delayed(Duration(milliseconds: 1))
//                   .then((value) => Navigator.pop(context));
//             }
//
//             return Stack(
//               children: [
//                 state is edit_product.Loading
//                     ? Center(
//                         child: CircularProgressIndicator(),
//                       )
//                     : Container(),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     ConstrainedBox(
//                         constraints: BoxConstraints(
//                           maxWidth: MediaQuery.of(context).size.width * 0.9,
//                           minWidth: MediaQuery.of(context).size.width * 0.9,
//                           minHeight: 50,
//                         ),
//                         child: Container(
//                           child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: BlocConsumer<
//                                   choose_category.ChooseCategoryCubit,
//                                   choose_category.ChooseCategoryState>(
//                                 bloc: chooseCategoryCubit,
//                                 listener: (context, state) {
//                                   state.when(
//                                     idle: () {},
//                                     loading: () {},
//                                     showCategoriesDialogue: () {},
//                                     mainCategoryChosen: (_) {},
//                                     subCategoryChosen:
//                                         (MainCategoryModel mainCategory,
//                                             SubCategoryModel subCategory) {
//                                       widget.categories.add(mainCategory.name);
//                                       widget.categories.add(subCategory.name);
//
//                                       // _chosenMainCategory = mainCategory.name;
//                                       // _chosenSubCategory = subCategory.name;
//                                     },
//                                     showMainCategories: (_) {},
//                                     showSubCategories: (_) {},
//                                   );
//                                 },
//                                 builder: (context, state) {
//                                   // if(state is choose_category.SubCategoryChosen){
//                                   if (widget.categories.isNotEmpty)
//                                     return addedItem(
//                                         '${widget.categories[0].english} , ${widget.categories[1].english}');
//                                   else
//                                     return Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Text(
//                                         'No categories added yet !',
//                                         style: TextStyle(
//                                             fontSize: 17,
//                                             fontWeight: FontWeight.w400,
//                                             color: Colors.grey),
//                                       ),
//                                     );
//                                 },
//                               )),
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.blue, width: 1.2),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         )),
//                     SizedBox(
//                       height: 15,
//                     ),
//
//                     // Text(
//                     //   'Add at most 1 category',
//                     //   style: TextStyle(fontSize: 18),
//                     // ),
//                   ],
//                 )
//               ],
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // chooseCategoryCubit.showCategoriesDialogue();
//           showCategoriesDialog(
//               chooseCategoryCubit: chooseCategoryCubit, context: context);
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
//
//   Widget addedItem(String itemTitle) {
//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Container(
//         height: 32,
//         child: Padding(
//           padding:
//               const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 8, left: 8),
//           child: ConstrainedBox(
//             constraints: BoxConstraints(
//               minWidth: 200,
//               maxWidth: 200,
//             ),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: Text(
//                     itemTitle,
//                     style: TextStyle(
//                         color: Colors.blueGrey.shade700,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 5,
//                 ),
//                 InkWell(
//                   child: Icon(
//                     Icons.close,
//                     color: Colors.blueGrey.shade700,
//                   ),
//                   onTap: () {
//                     setState(() {
//                       widget.categories.removeRange(0, 2);
//                     });
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           color: Colors.lightBlue.shade100,
//         ),
//       ),
//     );
//   }
// }
