import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/notifiers/products_notifier.dart';
import 'package:ecommerce_admin_tut/src/notifiers/select_banner_products_notifier.dart';
import 'package:ecommerce_admin_tut/src/routes/router.gr.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/notifiers/language_notifier.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_admin_tut/src/models/product_model.dart';
import 'package:ecommerce_admin_tut/src/res/text_styles.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;
  final bool canBeSelected;
  final bool canBeEdited;
  final bool isEnglish;

  ProductCard({
    required this.product,
    this.canBeSelected = false,
    this.canBeEdited = false,
    required this.isEnglish
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool checkBoxVal = false;


  @override
  Widget build(BuildContext context) {
    final selectBannerProductsNotifier =
        getItInstance<SelectBannerProductsNotifier>();

    final productsNotifierInstance = getItInstance<ProductsNotifier>();

    StackRouter appRouter = AutoRouter.of(context);
    return InkWell(
      onTap: () {
        productsNotifierInstance.setCurrentProduct(widget.product);
        appRouter.push(ProductDetailsScreen(
            product: widget.product,
            isEnglishLanguage: widget.isEnglish));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          height: MediaQuery.of(context).size.width * 0.45,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: CachedNetworkImage(
                    height: MediaQuery.of(context).size.height * .3,
                    width: MediaQuery.of(context).size.width * 0.2,
                    imageUrl: widget.product.image!,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              widget.isEnglish
                                  ? widget.product.name.english
                                  : widget.product.name.arabic,
                              style: AppTextStyles.medium14Black,
                            ),
                          ),
                          widget.canBeSelected
                              ? Checkbox(
                                  value: checkBoxVal,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      checkBoxVal = value!;
                                    });
                                    if (checkBoxVal)
                                      selectBannerProductsNotifier
                                          .addProduct(widget.product);
                                    else
                                      selectBannerProductsNotifier
                                          .removeProduct(
                                              widget.product);
                                  })
                              : Container(),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "L.E ${widget.product.price}",
                            style: AppTextStyles.normal12Black,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          '${getTranslated(context, StringsConstants.quantity)} : ${widget.product.basicQuantity.toString()}'),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          '${getTranslated(context, StringsConstants.remainQuantity)} : ${widget.product.remainQuantity}'),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          '${getTranslated(context, StringsConstants.numberOfSales)} : ${widget.product.numberOfSales}'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget _productView(BuildContext context, ProductModel productModel,
//     bool isEnglishLanguage, bool canBeSelected) {
//   bool checkBoxVal = false;
//
//   return Padding(
//     padding: const EdgeInsets.only(bottom: 8.0),
//     child: Container(
//       height: 160,
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         color: Colors.white,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             ClipRRect(
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(10), topRight: Radius.circular(10)),
//               child: CachedNetworkImage(
//                 height: MediaQuery.of(context).size.height * .3,
//                 width: MediaQuery.of(context).size.width * 0.2,
//                 imageUrl: productModel.image,
//                 fit: BoxFit.fitWidth,
//               ),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Container(
//               margin: EdgeInsets.all(5),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.55,
//                         child: Text(
//                           isEnglishLanguage
//                               ? productModel.name.english
//                               : productModel.name.arabic,
//                           style: AppTextStyles.medium14Black,
//                         ),
//                       ),
//                       canBeSelected ?  Checkbox(
//                           value: checkBoxVal,
//                           onChanged: (bool? value) {
//                             // setState(() {
//                             // this.valuesecond = value;
//                           }) : Container()
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Row(
//                     children: <Widget>[
//                       Text(
//                         "L.E ${productModel.price}",
//                         style: AppTextStyles.normal12Black,
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                       '${getTranslated(context, StringsConstants.basicQuantity)} : ${productModel.basicQuantity.toString()}'),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                       '${getTranslated(context, StringsConstants.remainQuantity)} : ${productModel.remainQuantity}'),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                       '${getTranslated(context, StringsConstants.soldQuantity)} : ${productModel.soldQuantity}'),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     ),
//   );
//   // return Padding(
//   //   padding: const EdgeInsets.only(bottom: 8.0),
//   //   child: Container(
//   //     height: 180,
//   //     child: Card(
//   //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//   //       color: Colors.white,
//   //       child: Row(
//   //         crossAxisAlignment: CrossAxisAlignment.start,
//   //         children: <Widget>[
//   //           ClipRRect(
//   //             borderRadius: BorderRadius.only(
//   //                 topLeft: Radius.circular(10), topRight: Radius.circular(10)),
//   //             child: CachedNetworkImage(
//   //               height: MediaQuery.of(context).size.height * .4,
//   //               width: MediaQuery.of(context).size.width * 0.3,
//   //               imageUrl: productModel.image,
//   //               fit: BoxFit.fitWidth,
//   //             ),
//   //           ),
//   //           SizedBox(
//   //             width: 10,
//   //           ),
//   //           Container(
//   //             // width: MediaQuery.of(context).size.width * 0.5,
//   //             margin: EdgeInsets.all(5),
//   //             child: Column(
//   //               crossAxisAlignment: CrossAxisAlignment.start,
//   //               children: <Widget>[
//   //                 SizedBox(
//   //                   height: 5,
//   //                 ),
//   //                 Container(
//   //                   width: 130,
//   //                   child: Text(
//   //                     productModel.name,
//   //                     style: AppTextStyles.medium14Black,
//   //                   ),
//   //                 ),
//   //                 SizedBox(
//   //                   height: 5,
//   //                 ),
//   //                 Row(
//   //                   children: <Widget>[
//   //                     Text(
//   //                       "${productModel.currency}${productModel.currentPrice}",
//   //                       style: AppTextStyles.normal12Black,
//   //                     ),
//   //                     // SizedBox(
//   //                     //   width: 10,
//   //                     // ),
//   //                     // Text(
//   //                     //   "${productModel.currency}${productModel.actualPrice}",
//   //                     //   style: AppTextStyles.normal12Color81819AStroke,
//   //                     // ),
//   //                   ],
//   //                 ),
//   //                 SizedBox(
//   //                   height: 10,
//   //                 ),
//   //                 Text(
//   //                   "${productModel.quantityPerUnit}${productModel.unit}",
//   //                   style: AppTextStyles.normal12Color81819A,
//   //                 ),
//   //               ],
//   //             ),
//   //           )
//   //         ],
//   //       ),
//   //     ),
//   //   ),
//   // );
// }
