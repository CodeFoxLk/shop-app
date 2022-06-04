import 'package:get/get.dart';
import 'package:shop_app/controllers/product/product_controller.dart';
import 'package:shop_app/screens/home_screen.dart';
import 'package:shop_app/screens/product_screen.dart';
import 'package:shop_app/screens/splash_screen.dart';

class AppRoutes {
  static List<GetPage<dynamic>> get pages => [
        GetPage(
          name: SplashScreen.routeName,
          page: () => const SplashScreen()
        ),
        GetPage(
            name: HomeScreen.routeName,
            page: () => const HomeScreen(),
            binding: BindingsBuilder(
                () => Get.put<ProductController>(ProductController()))),
        GetPage(
            name: ProductScreen.routeName,
            page: () => const ProductScreen(),
            binding: BindingsBuilder(
                () => Get.put<ProductController>(ProductController())))
      ];
}
