import 'package:ecommerce_admin_tut/src/core/utils/utils/trim_name.dart';
import 'package:ecommerce_admin_tut/src/models/banner_model.dart';
import 'package:ecommerce_admin_tut/src/ui/common/loading_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_admin_tut/src/core/utils/confirmation_dialogue_options.dart';
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/notifiers/banners_notifier.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:ecommerce_admin_tut/src/ui/common/confirmation_dialogue.dart';
import 'package:ecommerce_admin_tut/src/ui/common/edit_field_modal_bottom_sheet.dart';
import 'package:ecommerce_admin_tut/src/ui/common/field_name.dart';
import 'package:ecommerce_admin_tut/src/bloc/banner_item/banner_item.dart'
    as banner_item;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'banner_products.dart';

class BannerDetailsScreen extends StatefulWidget {
  final BannerModel banner;
  final bool isEnglish;

  BannerDetailsScreen({required this.banner, required this.isEnglish});

  @override
  _BannerDetailsScreenState createState() => _BannerDetailsScreenState();
}

class _BannerDetailsScreenState extends State<BannerDetailsScreen> {
  late TextEditingController enNameController;
  late TextEditingController arNameController;
  final bannerItemCubit = getItInstance<banner_item.BannerItemCubit>();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  late StackRouter appRouter;

  onFieldPressed(
      TextEditingController fieldController, String fieldName, bool isEnglish) {
    updateBannerNameFunction(String name) {
      bannerItemCubit.updateBannerName(
          name: TrimName.trimName(name),
          id: widget.banner.id!,
          isEnglishName: isEnglish);
    }

    editFieldModalBottomSheet(
        fieldName: fieldName,
        onSave: updateBannerNameFunction,
        fieldValue: fieldController.text,
        context: context);
  }

  void deleteBanner() {
    Future.delayed(Duration(milliseconds: 1)).then((value) => showLoadingDialog(context, _keyLoader));
    bannerItemCubit.deleteBanner(widget.banner.id!);

  }

  void closeLoadingDialogue(){
    Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();
  }

  @override
  void initState() {
    enNameController = TextEditingController(text: widget.banner.name.english);
    arNameController = TextEditingController(text: widget.banner.name.arabic);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appRouter = AutoRouter.of(context);
    return Scaffold(
      appBar: AppBar(
        title: BlocConsumer<banner_item.BannerItemCubit,
            banner_item.BannerItemState>(
          bloc: bannerItemCubit,
          listener: (context, state) {
            state.when(
              idle: () {},
              deleting: (){
                // deleteBanner();
              },
              imageClosed: () {},
              loading: () {},
              enNameEdited: (enName) {
                enNameController.text = enName;
                widget.banner.name.english = enName;
              },
              arNameEdited: (arName) {
                arNameController.text = arName;
                widget.banner.name.arabic = arName;
              },
              error: (e) {},
              imagePicked: (imageFile) {},
              imageUpdated: (image) {
                BannerModel banner = widget.banner;
                banner.image = image;
              },
              bannerUploaded: (_) {},
              deleted: () {
                closeLoadingDialogue();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(getTranslated(context,
                        StringsConstants.categoryDeletedSuccessfully)!),
                  ),
                );
                appRouter.pop();
              },
            );
          },
          builder: (context, state) {
            return Text(enNameController.text);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              await showConfirmationDialogue(
                  confirmationDialogueChoice:
                      ConfirmationDialogueOptions.deleteBanner,
                  yesFunction: deleteBanner,
                  context: context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Card(
              elevation: 2,
              child: Container(
                child: Stack(
                  children: [
                    BlocBuilder<banner_item.BannerItemCubit,
                        banner_item.BannerItemState>(
                      bloc: bannerItemCubit,
                      builder: (BuildContext context, state) {
                        return CachedNetworkImage(
                          height: 230,
                          fit: BoxFit.fill,
                          imageUrl: state is banner_item.ImageUpdated
                              ? state.image
                              : widget.banner.image!,
                        );
                      },
                    ),
                    Positioned.fill(
                      right: 5,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.blue.shade300,
                          child: IconButton(
                            onPressed: addImageIcon,
                            icon: Icon(
                              Icons.add_a_photo_sharp,
                              size: 30,
                              color: Colors.white,
                            ),
                            // color: Colors.blue.shade400,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            BlocBuilder<banner_item.BannerItemCubit,
                banner_item.BannerItemState>(
              bloc: bannerItemCubit,
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    onFieldPressed(
                        enNameController, StringsConstants.englishName, true);
                  },
                  child: FieldName(
                    icon: Icon(
                      Icons.title,
                      color: Colors.grey,
                    ),
                    fieldName: StringsConstants.englishName,
                    fieldValue: enNameController.text,
                  ),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<banner_item.BannerItemCubit,
                banner_item.BannerItemState>(
              bloc: bannerItemCubit,
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    onFieldPressed(
                        arNameController, StringsConstants.arabicName, false);
                  },
                  child: FieldName(
                    icon: Icon(
                      Icons.title,
                      color: Colors.grey,
                    ),
                    fieldName: StringsConstants.arabicName,
                    fieldValue: arNameController.text,
                  ),
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BannerProducts(
                                bannerName: widget.banner.name,
                                isEnglish: widget.isEnglish,
                              )));
                },
                child: Text(
                    getTranslated(context, StringsConstants.showProducts)!)),
          ],
        ),
      ),
    );
  }

  addImageIcon() {
    bannerItemCubit.pickAndUpdateImage(widget.banner.id!);
  }
}
