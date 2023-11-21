import 'dart:math';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rate_my_quilt/Model/ChatModel.dart';
import 'package:rate_my_quilt/Services/AdMob_Service.dart';

String commonimagerootpath = "assets/images/";
String commoniconrootpath = "assets/icons/";

String logo = "${commonimagerootpath}logo.png";
String applicationlogo = "${commonimagerootpath}applicationicon.png";
String profileimage = "${commonimagerootpath}profileimage.png";
String applogo = "${commonimagerootpath}applogo.png";
String quiltimage = "${commonimagerootpath}quiltimage.png";
String signupprofileimage = "${commonimagerootpath}signupprofileimage.png";
String blackandwhiteapplicationicon =
    "${commonimagerootpath}blackandwhiteapplicationicon.png";
String starrattingicon = "${commoniconrootpath}starrattingicon.png";

String arrowforwardicon = "${commoniconrootpath}arrowforwardicon.png";
// String attherateicon = "${commoniconrootpath}attherateicon.png";
String attherateicon = "${commoniconrootpath}attherateicon.svg";
String bookmarkicon = "${commoniconrootpath}bookmarkicon.png";
// String bookmarkicon = "${commoniconrootpath}bookmarkicon.svg";
String facebookicon = "${commoniconrootpath}facebookicon.png";
String googleicon = "${commoniconrootpath}googleicon.png";
String homeicon = "${commoniconrootpath}homeicon.png";
//String homeicon = "${commoniconrootpath}homeicon.svg";
// String lockicon = "${commoniconrootpath}lockicon.png";
String lockicon = "${commoniconrootpath}lockicon.svg";
String messageicon = "${commoniconrootpath}messageicon.png";
//String messageicon = "${commoniconrootpath}messageicon.svg";
//  String notificationicon = "${commoniconrootpath}notificationicon.png";
String notificationicon = "${commoniconrootpath}notificationicon.svg";
String notificationiconred = "${commoniconrootpath}notificationiconred.svg";
//  String searchicon = "${commoniconrootpath}searchicon.png";
String searchicon = "${commoniconrootpath}searchicon.svg";
String profileicon = "${commoniconrootpath}profileicon.png";
//String profileicon = "${commoniconrootpath}profileicon.svg";
String uploadicon = "${commoniconrootpath}uploadicon.png";
String sendchaticon = "${commoniconrootpath}sendchaticon.png";
// String personicon = "${commoniconrootpath}personicon.png";
String personicon = "${commoniconrootpath}personicon.svg";

String baseurl = "https://ratemyquilts.com/api/";
String loginurl = "${baseurl}login";
String signupurl = "${baseurl}registration";
String getpostsurl = "${baseurl}posts";
String getfollowingurl = "${baseurl}following_posts";
String addpostsurl = "${baseurl}add_post";
String addratting = "${baseurl}add_rating";
String topatedpost = "${baseurl}top_rated_posts";
String myprofile = "${baseurl}my_profile";
String userprofile = "${baseurl}user_profile?user_id=";
String userprofileurl = "${baseurl}toggle_follow";
String userchatsurl = "${baseurl}user_chats";
String createchaturl = "${baseurl}create_chat";

class Keys {
  static String token = "token";
  static String fullname = "full_name";
  static String email = "email";
  static String profilepic = "profile_pic";
  static String myid = "my_id";
}

List<ChatModel> chatlist = [
  ChatModel(message: "Not so good...", time: "02:39 PM", isme: false),
  ChatModel(message: "What about you?", time: "02:39 PM", isme: true),
  ChatModel(message: "Perfect!", time: "02:39 PM", isme: true),
  ChatModel(message: "How your life is going?", time: "02:39 PM", isme: false),
  ChatModel(message: "Hello", time: "02:39 PM", isme: false),
];

String user_name = "";
String e_mail = "";
String profile = "";
String token = "";
String myid = "";

String ANDROID_BANNER_ADD_ID = 'ca-app-pub-3940256099942544/6300978111';
String ANDROID_Rewarded_ADD_ID = 'ca-app-pub-3940256099942544/5224354917';
String ANDROID_Native_ADD_ID = 'ca-app-pub-3940256099942544/2247696110';

int adcount = 0;
double? dialogboxsubmitratting;

final BannerAd myBanner = BannerAd(
  adUnitId: AdMobService.bannerAdUnitId ?? '',
  size: AdSize.banner,
  request: const AdRequest(),
  listener: const BannerAdListener(),
);

RewardedAd? rewardedad;
void createrewarderad() {
  RewardedAd.load(
      adUnitId: ANDROID_Rewarded_ADD_ID, //AdMobService.rewardedAdUnitId ?? '',
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: (Rewardedadd) {
        rewardedad = Rewardedadd;
      }, onAdFailedToLoad: (error) {
        rewardedad = null;
      }));
}

loadrewarded() {
  if (rewardedad != null) {
    rewardedad!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        createrewarderad();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        createrewarderad();
      },
    );
    rewardedad!.show(onUserEarnedReward: (ad, reward) {
      print("adddddd showwwww");
      adcount = 0;
    });
    rewardedad = null;
  }
}

late NativeAd nad;
bool isadloaded = false;

void loadnativead() {
  nad = NativeAd(
      adUnitId: 'ca-app-pub-3940256099942544/2247696110',
      factoryId: 'listTile',
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          isadloaded = true;
        },
        onAdFailedToLoad: (ad, loaderror) {
          ad.dispose();
        },
      ),
      request: AdRequest());
  nad.load();
}
