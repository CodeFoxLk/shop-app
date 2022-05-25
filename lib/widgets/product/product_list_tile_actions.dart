import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:shop_app/configs/theme/custom_theme_data.dart';

class ProductListTileActions extends StatefulWidget {
  const ProductListTileActions(
      {Key? key,})
      : super(key: key);
  @override
  State<ProductListTileActions> createState() => _ProductListTileActionsState();
}

class _ProductListTileActionsState extends State<ProductListTileActions> {

  bool isInCart = false;
  bool isInWishList = false;
  
  @override
  Widget build(BuildContext context) {
    final themeData = CustomThemeExtension(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        LikeButton(
          isLiked: isInWishList,
          size: 25,
          circleColor: CircleColor(
              start: themeData.appColors.favouritButtonColor,
              end: themeData.appColors.favouritButtonColor.withOpacity(0.5)),
          bubblesColor: BubblesColor(
            dotPrimaryColor: themeData.appColors.favouritButtonColor,
            dotSecondaryColor: themeData.appColors.favouritButtonColor.withOpacity(0.5),
          ),
          likeBuilder: (bool isLiked) {
            isInWishList = isLiked;
            return Icon(
              Icons.favorite,
              color: isLiked ? themeData.appColors.favouritButtonColor : themeData.appColors.unSelectedColor,
              size: 25,
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: LikeButton(
            isLiked:isInCart,
            size: 25,
            circleColor: CircleColor(
                start: themeData.appColors.cartButtonColors,
                end: themeData.appColors.cartButtonColors.withOpacity(0.5)),
            bubblesColor: BubblesColor(
              dotPrimaryColor: themeData.appColors.cartButtonColors,
              dotSecondaryColor: themeData.appColors.cartButtonColors.withOpacity(0.5),
            ),
            likeBuilder: (bool isLiked) {
              isInCart = isLiked;
              return Icon(
                Icons.shopping_cart,
                color: isLiked ? themeData.appColors.cartButtonColors : themeData.appColors.unSelectedColor,
                size: 25,
              );
            },
          ),
        ),
        
      ],
    );
  }
}
