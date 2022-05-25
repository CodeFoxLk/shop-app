import 'package:flutter/material.dart';
import 'package:shop_app/configs/theme/custom_text_styles.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice(
      {Key? key,
      this.isDiscountAvailable = false,
      this.price = 'U\$ 0.0',
      this.originalPrice = 'U\$ 0.0'})
      : super(key: key);

  ///show original price vs discounted price
  final bool isDiscountAvailable;
  final String price;
  final String originalPrice;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).extension<CustomTextStyles>();
    return Row(
      children: [
        Text(price, style: textTheme?.titleTextStyle), //USD $price'
        Visibility(
          visible: isDiscountAvailable,
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(originalPrice, //'USD $originalPrice'
                style: 
                    textTheme?.secondaryTextStyle.copyWith(
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 2)),
          ),
        ),
      ],
    );
  }
}
