import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shop_app/firebase_options.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screens/product_screen.dart';
import 'package:shop_app/utils/logger.dart';

import 'product/product_controller.dart';

class DynamicLinkController {
  
  // when app is forgorund. this methods will get the dynamic link if it is available
  static Future<PendingDynamicLinkData?> initializeApp() async {
    await Firebase.initializeApp(  options: DefaultFirebaseOptions.currentPlatform);
    final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
    return initialLink;
  }

  static void listen() {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      navigationHandler(link: dynamicLinkData);
    }).onError((error) {
      logger.e(error);
    });
  }

  static navigationHandler({PendingDynamicLinkData? link}) {
    if (link != null) {
      final Uri deepLink = link.link;
      final params = deepLink.queryParameters;
 
      try {
       // if app is back ground running and there is already created [ProductController], then onReady is not calling as newly created controller, should call it like this
       // so fetchSingleProduct() might not work. then we needs to call fetchSingleProduct() manually
       // if product contrroller not available. it will be trow and error
        ProductController controller = Get.find<ProductController>();
        controller.navigateToProductScreen(productId: params['productId']!);
        return;
        
      } catch (e) {
        logger.e(e);
      }

      // if there is not product controller available, the navigation method will be call from onReady() in the product controller.
      // since controller is just creating by below navigation. -> check AppRoutes class 
      // usefull if app is in forground
      Get.toNamed(ProductScreen.routeName, parameters: {'productId' : params['productId']! });
    }
  }

  static Future<ShortDynamicLink> create(Product product) async {
    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.https('github.com', '/CodeFoxLk', {
        'productId': product.id.toString()
      }), // Uri(scheme: "https", host:"eshannimesha.com", queryParameters : {'productId' : productId} ),
      uriPrefix: "https://shopappdl.page.link",
      //navigationInfoParameters: NavigationInfoParameters(),
      androidParameters:  const AndroidParameters(packageName: "com.example.shop_app"),
      iosParameters: const IOSParameters(bundleId: "com.example.app.ios"),
      socialMetaTagParameters: SocialMetaTagParameters(
        description: product.description,
        imageUrl: Uri.parse(product.image),
        title: product.title
      )
    );
    final dynamicLink = await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams, shortLinkType: ShortDynamicLinkType .unguessable);
    shareLink(dynamicLink);
    return dynamicLink;
  }

  static void shareLink(ShortDynamicLink  link){
   Share.share('check out this product ${link.shortUrl}');
  }
}

//https://shopappdl.page.link
