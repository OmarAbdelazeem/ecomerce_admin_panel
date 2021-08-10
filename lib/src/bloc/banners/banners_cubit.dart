import 'package:bloc/bloc.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/banner_model.dart';
import 'package:ecommerce_admin_tut/src/repository/firestore_repository.dart';
import 'banners_state.dart';

class BannersCubit extends Cubit<BannersState> {
  BannersCubit() : super(BannersState.idle());
  final fireStoreRepo = getItInstance<FirestoreRepository>();
  List<BannerModel> _bannersList = [];


  void fetchBanners() async {
    emit(BannersState.loading());
    try {
      final docs = await fireStoreRepo.fetchBanners();
      _bannersList = List.generate(docs.length, (index) {
        Object? doc = docs[index].data();
        return BannerModel.fromJson(doc);
      });
      emit(BannersState.loaded(_bannersList));
    } catch (e) {
      emit(BannersState.error(e.toString()));
      print('banners cubit fetchBanners function error is $e');
    }
  }

  void addNewBannerLocally(BannerModel banner){
    emit(BannersState.loading());
    _bannersList.add(banner);
    emit(BannersState.loaded(_bannersList));
  }

  void removeBannerLocally(BannerModel banner){
    emit(BannersState.loading());
    _bannersList.remove(banner);
    emit(BannersState.loaded(_bannersList));
  }


}
