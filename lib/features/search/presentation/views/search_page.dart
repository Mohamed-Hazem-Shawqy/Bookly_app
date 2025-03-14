import 'package:bookly_app/features/search/presentation/views/widgets/search_page_body.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchPageBody(),
    );
  }
}
