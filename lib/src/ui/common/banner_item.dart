import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_admin_tut/src/bloc/banner_item/banner_item.dart'
    as banner_item;
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/banner_model.dart';
import 'package:ecommerce_admin_tut/src/notifiers/banners_notifier.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/banner_products.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_admin_tut/src/routes/router.gr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerItemView extends StatefulWidget {
  final BannerModel banner;
  final bool isEnglish;
  BannerItemView({required this.banner , required this.isEnglish});

  @override
  _BannerItemViewState createState() => _BannerItemViewState();
}

class _BannerItemViewState extends State<BannerItemView> {
  final bannerItemCubit = getItInstance<banner_item.BannerItemCubit>();
  final bannersNotifier = getItInstance<BannersNotifier>();
  StackRouter? appRouter;
  File? imageFile;

  void onSwitchChanged(bool value) async {
    setState(() {
      widget.banner.isOpened = value;
    });
    bannerItemCubit.updateBannerSwitchValue(widget.banner.id!, value);
  }

  @override
  Widget build(BuildContext context) {
    appRouter = AutoRouter.of(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          bannersNotifier.setCurrentBanner(widget.banner);
          appRouter!.push(BannerDetailsScreen(banner: widget.banner , isEnglish: widget.isEnglish));
        },
        child: Card(
          color: Colors.grey.shade50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 250,
                child: BlocBuilder<banner_item.BannerItemCubit,
                    banner_item.BannerItemState>(
                  bloc: bannerItemCubit,
                  builder: (BuildContext context, state) {
                    return CachedNetworkImage(
                      fit: BoxFit.fitWidth,
                      height: 230,
                      imageUrl: state is banner_item.ImageUpdated
                          ? state.image
                          : widget.banner.image!,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(widget.isEnglish ? widget.banner.name.english : widget.banner.name.arabic),
              ),
              SizedBox(
                height: 10,
              ),
              Switch(value: widget.banner.isOpened, onChanged: onSwitchChanged),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                BannerProducts(bannerName: widget.banner.name,isEnglish: widget.isEnglish,)));
                  },
                  child: Text(
                      getTranslated(context, StringsConstants.showProducts)!)),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  addImageIcon() {
    bannerItemCubit.pickAndUpdateImage(widget.banner.id!);
  }
}
