import 'package:bookly_app/core/utils/api_serveice.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imple.dart';
import 'package:bookly_app/features/search/data/repo/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  //الى هعيد استخدامها serveice بنشئ جواها ال
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImple>(
    HomeRepoImple(getIt.get<ApiService>()),
  );
  getIt.registerSingleton<SearchRepoImpl>(
      SearchRepoImpl(apiService: getIt.get<ApiService>()));
}
