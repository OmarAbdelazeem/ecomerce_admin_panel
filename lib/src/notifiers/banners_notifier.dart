import 'package:ecommerce_admin_tut/src/models/banner_model.dart';
import 'package:flutter/cupertino.dart';

class BannersNotifier extends ChangeNotifier {
  bool _isBannerRemoved = false;
  bool _isNewBannerAdded = false;
  BannerModel? _banner;


  void removeBanner() {
    _isBannerRemoved = true;
    notifyListeners();
  }

  void setCurrentBanner(BannerModel banner){
    _banner = banner;
  }


  void addBanner(BannerModel banner){
    _banner = banner;
    _isNewBannerAdded = true;
  }

  void backToDefault() {
    _isBannerRemoved = false;
    _isNewBannerAdded = false;
  }

  get isBannerRemoved => _isBannerRemoved;


  get isNewBannerAdded => _isNewBannerAdded;

  get banner => _banner;
}
