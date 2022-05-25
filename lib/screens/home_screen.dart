import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/configs/theme/custom_theme_data.dart';
import 'package:shop_app/controllers/product/product_controller.dart';
import 'package:shop_app/widgets/product/product_list_tile.dart';

import '../widgets/comman/loading.dart';

class HomeScreen extends GetView<ProductController> {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = "/Home";

  @override
  Widget build(BuildContext context) {
    final themeData = CustomThemeExtension(context);
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (controller.isProductsLoading.value) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Loading(), Text("Please wait.....")],
            );
          }
          return ListView.separated(
              padding: themeData.uiParameters.screenPadding,
              itemBuilder: (_, index) => ProductListTile(
                    onShare: () {},
                    product: controller.products[index],
                    onTap: () {
                       controller.createSharableLink(product: controller.products[index]);
                      // controller.navigateToProductScreen(
                      //     productId: controller.products[index].id.toString());
                    },
                  ),
              separatorBuilder: (_, index) => const SizedBox(height: 10),
              itemCount: controller.products.length);
        }),
      ),
    );
  }
}
