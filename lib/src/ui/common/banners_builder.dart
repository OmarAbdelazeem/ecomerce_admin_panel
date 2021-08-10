import 'package:ecommerce_admin_tut/src/notifiers/language_notifier.dart';
import 'package:ecommerce_admin_tut/src/notifiers/provider_notifier.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_admin_tut/src/bloc/banners/banners.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_admin_tut/src/bloc/banners/banners.dart' as banners;
import 'banner_item.dart';

Widget bannersDataBuilder({required BannersCubit bannersCubit}) {
  return BlocBuilder<banners.BannersCubit, banners.BannersState>(
    bloc: bannersCubit,
    builder: (BuildContext context, state) {
      if (state is banners.Loading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is banners.Loaded) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: state.banners.length,
            itemBuilder: (BuildContext context, index) {
              return ProviderNotifier(child: (LanguageNotifier languageNotifier){
                return BannerItemView(banner: state.banners[index],isEnglish: languageNotifier.isEnglish,);
              });
            });
      }
      else if(state is banners.Error)
        return Text(state.error);

      else
        return Container();
    },
  );
}

