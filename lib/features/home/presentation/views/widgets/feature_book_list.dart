import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FeatureBookView extends StatelessWidget {
  const FeatureBookView({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(23),
      child: AspectRatio(
        aspectRatio: 1 / 1.5,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
