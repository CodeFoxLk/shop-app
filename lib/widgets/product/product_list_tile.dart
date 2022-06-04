import 'package:flutter/material.dart';
import 'package:shop_app/configs/theme/custom_theme_data.dart';
import 'package:shop_app/models/product.dart';
import 'product_list_tile_actions.dart';
import 'product_price.dart';
import 'star_ratings.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile(
      {Key? key, required this.product, this.wishListItem = false, required this.onTap, required this.onShare})
      : super(key: key);

  final Product product;
  final bool wishListItem;
  final VoidCallback onTap;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    final themeData = CustomThemeExtension(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: themeData.uiParameters.cardBorderRadius,
      ),
      
      child: InkWell(
        borderRadius: themeData.uiParameters.cardBorderRadius,
        onTap: onTap,
        child: Padding(
          padding: themeData.uiParameters.cardPadding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: themeData.uiParameters.cardBorderRadius,
                      color: Theme.of(context).cardColor,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(product.image),
                          alignment: Alignment.center))),
              SizedBox(width: themeData.uiParameters.contentGap),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      product.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: themeData.customTextStyle.titleTextStyle
                    ),
                     Text(
                      product.description ?? ' ',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: StarRatingBar(
                        alignment: MainAxisAlignment.start,
                        showText: false,
                        rating: product.rating?.rate ?? 0.0,
                        startCount: 5,
                      ),
                    ),
                  // const Spacer(),
                    Text('Shipping from china',
                        style: themeData.customTextStyle.secondaryTextStyle),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ProductPrice(
                          price: '\$${product.price.toString()}' ,
                        ),
                        const Spacer(),
                         ProductListTileActions(
                          onShare: onShare,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
