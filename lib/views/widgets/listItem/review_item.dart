import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:pcplus/config/asset_helper.dart';
import 'package:pcplus/themes/palette/palette.dart';
import 'package:pcplus/themes/text_decor.dart';

class ReviewItem extends StatefulWidget {
  const ReviewItem({super.key});

  @override
  State<ReviewItem> createState() => _ReviewItemState();
}

class _ReviewItemState extends State<ReviewItem> {
  double rating = 3.5;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Palette.borderBackBtn,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(AssetHelper.defaultAvt),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Gap(10),
              Text(
                'Pham Thanh Tuong',
                style: TextDecor.robo16,
              ),
            ],
          ),
          Row(
            children: [
              RatingBar.builder(
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 18,
                unratedColor: Palette.primaryColor,
                itemBuilder: (context, index) {
                  if (index < rating) {
                    return const Icon(
                      Icons.star,
                      color: Colors.amber,
                    );
                  } else {
                    return const Icon(
                      Icons.star_border_outlined,
                    );
                  }
                },
                ignoreGestures: true,
                onRatingUpdate: (rating) {},
              ),
              const Gap(4),
              Text(
                '01/01/2021',
                style: TextDecor.robo15,
              ),
            ],
          ),
          const Gap(8),
          Text(
            'Ramayana Prambanan is a show that combines dance and drama without dialogue, based on the Ramayana story.',
            style: TextDecor.robo15.copyWith(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
