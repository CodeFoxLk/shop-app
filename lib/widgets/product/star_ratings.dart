
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: must_be_immutable
class StarRatingBar extends StatefulWidget {
 StarRatingBar({
    Key? key,
    this.startCount = 1,
    this.onRate,
    this.rating = 4.5,
    this.size = 16,
    this.showText = true, this.isRatable = false, this.alignment = MainAxisAlignment.center,
  }) : super(key: key);

  final int startCount;
  final VoidCallback? onRate;
  double rating = 4.5;
  final double size;
  final bool showText;
  final bool isRatable;
  final MainAxisAlignment alignment;

  @override
  // ignore: library_private_types_in_public_api
  _StarRatingBarState createState() => _StarRatingBarState();
}

class _StarRatingBarState extends State<StarRatingBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.alignment,
      children: [
        RatingBar.builder(
          initialRating: widget.rating,
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemSize: widget.size,
          itemCount: widget.startCount,
          itemPadding: const EdgeInsets.symmetric(horizontal: 0),
          glowColor: Colors.amber,
          updateOnDrag: true,
          unratedColor: Colors.grey,
          glowRadius: 0.2,
          glow: false,
          ignoreGestures: !widget.isRatable,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
             setState(() {
              widget.rating = rating;
            });
           
          } ,
        ),
        if (widget.showText) Text(" ${widget.rating}")
      ],
    );
  }
}

