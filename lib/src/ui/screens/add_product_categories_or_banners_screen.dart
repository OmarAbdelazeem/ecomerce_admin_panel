// import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
// import 'package:ecommerce_admin_tut/src/models/name_field_model.dart';
// import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
// import 'package:ecommerce_admin_tut/src/ui/common/choose_category.dart';
// import 'package:flutter/material.dart';
// import 'package:ecommerce_admin_tut/src/bloc/choose_category/choose_category.dart'
//     as choose_category;
// import 'package:ecommerce_admin_tut/src/bloc/edit_product/edit_product.dart'
//     as edit_product;
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class AddProductCategoriesField extends StatefulWidget {
//   final String fieldName;
//   final String productId;
//   final List <NameField> items;
//
//   AddProductCategoriesField({required this.fieldName, required this.productId , required this.items});
//
//   @override
//   _AddProductCategoriesFieldState createState() =>
//       _AddProductCategoriesFieldState();
// }
//
// class _AddProductCategoriesFieldState extends State<AddProductCategoriesField> {
//   List<NameField> addedItems = [];
//   final chooseCategoryCubit =
//       getItInstance<choose_category.ChooseCategoryCubit>();
//   final editProductCubit = getItInstance<edit_product.EditProductCubit>();
//   NameField? chosenMainCategory;
//   NameField? chosenSubCategory;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.fieldName),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 editProductCubit.updateProductCategory(
//                     chosenMainCategory!, chosenSubCategory!, widget.productId);
//               },
//               icon: Icon(Icons.check),
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           width: MediaQuery.of(context).size.width * 1,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.9,
//                 child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: widget.fieldName == StringsConstants.categories ? [addedItem(chosenSubCategory!.english)] :
//                           addedItems.map((e) => addedItem(e.english)).toList(),
//                     )),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.blue, width: 1.2),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               // Text(
//               //   'Add at most 1 category',
//               //   style: TextStyle(fontSize: 18),
//               // ),
//               BlocBuilder<choose_category.ChooseCategoryCubit,
//                   choose_category.ChooseCategoryState>(
//                 bloc: chooseCategoryCubit,
//                 builder: (context, state) {
//                   if (state is choose_category.SubCategoryChosen) {
//                     setState(() {
//                       chosenMainCategory = state.chosenMainCategory.name;
//                       chosenSubCategory = state.chosenSubCategory.name;
//                     });
//                   }
//                   return Container();
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // chooseCategoryCubit.showCategoriesDialogue();
//           showCategoriesDialog(
//               chooseCategoryCubit: chooseCategoryCubit, context: context);
//           ;
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
//               minWidth: 100,
//               maxWidth: MediaQuery.of(context).size.width * 0.7,
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
//                   onTap: () {},
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
//
// /*Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           width: MediaQuery.of(context).size.width * 1,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [addedCategoryItem()],
//                     )
//                     // Text('Add categories',style: TextStyle(color: Colors.grey),),
//                     ),
//                 height: 100,
//                 width: MediaQuery.of(context).size.width * 0.9,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.blue, width: 1.2),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       )*/
