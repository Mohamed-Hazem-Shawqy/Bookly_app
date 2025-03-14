import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imple.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_book_cubit/featured_book_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_book_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  
  await dotenv.load(fileName: 'api_key.env');
  setup();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FeaturedBookCubit>(
          create: (context) => FeaturedBookCubit(
            getIt.get<HomeRepoImple>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider<NewestBooksCubit>(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImple>(),
          )..fetchNewestFeaturedBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}

//https://www.googleapis.com/books/v1/volumes?q=flutter&key=AIzaSyCOFeCCwNbNWlGTZoGUw6-0oPxZ040m92s