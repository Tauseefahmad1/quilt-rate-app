import 'dart:io';

import 'package:rate_my_quilt/Utils/Constants.dart';

class AdMobService {
  static String? get bannerAdUnitId {
    if (Platform.isAndroid) {
      return ANDROID_BANNER_ADD_ID;
    } else if (Platform.isIOS) {
      // return IOS_BANNER_ADD_ID;
    }
    return null;
  }

  static String? get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return ANDROID_Rewarded_ADD_ID;
    } else if (Platform.isIOS) {
      //return IOS_INTERSTITIAL_ADD_ID;
    }
    return null;
  }
}
