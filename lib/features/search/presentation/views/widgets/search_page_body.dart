import 'package:bookly_app/core/utils/text_style.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_text_filed.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_result_list.dart';
import 'package:flutter/material.dart';

class SearchPageBody extends StatelessWidget {
  const SearchPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          CustomTextFiled(),
          SizedBox(height: 20),
          Text(
            "Result",
            style: Style.textStyle18,
          ),
          SizedBox(height: 20),
          Expanded(
            child: SearchResultListView(),
          ),
        ],
      ),
    );
  }
}
