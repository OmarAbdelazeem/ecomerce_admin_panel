import 'package:ecommerce_admin_tut/src/notifiers/banners_notifier.dart';
import 'package:ecommerce_admin_tut/src/notifiers/provider_notifier.dart';
import 'package:ecommerce_admin_tut/src/routes/router.gr.dart';
import 'package:ecommerce_admin_tut/src/ui/common/banners_builder.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_admin_tut/src/bloc/banners/banners.dart' as banners;
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:flutter/material.dart';


class BannersScreen extends StatefulWidget {
  @override
  _BannersScreenState createState() => _BannersScreenState();
}

class _BannersScreenState extends State<BannersScreen>
    with AutomaticKeepAliveClientMixin {
  final bannersCubit = getItInstance<banners.BannersCubit>();
  late StackRouter appRouter;

  @override
  void initState() {
    bannersCubit.fetchBanners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appRouter = AutoRouter.of(context);
    return Scaffold(
      body: ProviderNotifier(
        child: (BannersNotifier bannersNotifier){
          if(bannersNotifier.isNewBannerAdded){
            bannersCubit.addNewBannerLocally(bannersNotifier.banner);
            bannersNotifier.backToDefault();
          }
          else if(bannersNotifier.isBannerRemoved){
            bannersCubit.removeBannerLocally(bannersNotifier.banner);
            bannersNotifier.backToDefault();
          }
          return bannersDataBuilder(bannersCubit: bannersCubit);
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: '2',
        onPressed: (){
          appRouter.push(AddNewBannerScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
