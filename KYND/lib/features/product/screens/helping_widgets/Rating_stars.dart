import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final double rating; // Rating value as double
  final Color ratedStarColor; // Color for rated stars
  final Color unratedStarColor; // Color for unrated stars
  final Color borderColor; // Color for the border of stars
  final double size;

  const RatingStars({
    Key? key,
    required this.rating,
    this.ratedStarColor = Colors.amber,
    this.unratedStarColor = Colors.grey,
    this.borderColor = Colors.grey,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        IconData icon;
        Color color;

        if (index < rating.floor()) {
          icon = Icons.star;
          color = ratedStarColor;
        } else if (index < rating) {
          icon = Icons.star_half;
          color = ratedStarColor;
        } else {
          icon = Icons.star_border;
          color = unratedStarColor;
        }

        return Stack(
          children: [
            Icon(
              Icons.star_border,
              color: borderColor,
              size: size,
            ),
            Icon(
              icon,
              color: color,
              size: size,
            ),
          ],
        );
      }),
    );
  }
}
