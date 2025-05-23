import 'package:bookly_app/core/utils/text_style.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similiar_horizontial_list.dart';
import 'package:flutter/material.dart';

class SimiliarBookListSection extends StatelessWidget {
  const SimiliarBookListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You can also like",
          style: Style.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        const SimiliarHorizontailList(),
      ],
    );
  }
}
