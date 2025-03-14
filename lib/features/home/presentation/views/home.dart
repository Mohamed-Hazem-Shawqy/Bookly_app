import 'package:bookly_app/core/utils/text_style.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_listview.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/feaure_book_listview.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                FeatureBooksListView(),
                SizedBox(height: 20),
                Text(
                  "Newest",
                  style: Style.textStyle18,
                ),
                SizedBox(height: 20),
                NewestListView(),
              ],
            ),
          ),
        ),
        // SliverFillRemaining(
        //   // hasScrollBody: true,
        //   child: NewestListView(),
        // ),
      ],
    ));
  }
}
