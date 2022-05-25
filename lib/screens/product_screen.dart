import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shop_app/configs/theme/custom_theme_data.dart';
import 'package:shop_app/controllers/product/product_controller.dart';
import 'package:shop_app/widgets/comman/loading.dart';
import 'package:shop_app/widgets/product/star_ratings.dart';

class ProductScreen extends GetView<ProductController> {
  const ProductScreen({Key? key}) : super(key: key);
  static const routeName = "/product-screen";
  @override
  Widget build(BuildContext context) {
    final themeData = CustomThemeExtension(context);
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        if (controller.isProductLoading.value) {
          return const Loading();
        }
        if (controller.product == null) {
          return const Center(child: Text("Not found a Product"));
        }
        final product = controller.product!;
        return SingleChildScrollView(
          padding: themeData.uiParameters.screenPadding.copyWith(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                    width: double.maxFinite,
                    //height: 300,
                    decoration: BoxDecoration(
                        borderRadius: themeData.uiParameters.cardBorderRadius,
                        color: Theme.of(context).cardColor,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(product.image),
                            alignment: Alignment.center))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 10),
                child: Text(product.title, style: themeData.customTextStyle.titleTextStyle),
              ),
              Text(product.description ?? '', style: themeData.customTextStyle.detailsTextStyle),
              Text('\$${product.price}' , style: themeData.customTextStyle.titleTextStyle),
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: StarRatingBar(
                        alignment: MainAxisAlignment.start,
                        showText: false,
                        rating: product.rating?.rate ?? 0.0,
                        startCount: 5,
                      ),
                    ),
                    Text('(${product.rating?.count?.toInt().toString() ?? ' '})',)
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
