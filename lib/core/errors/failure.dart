import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromdioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'Bad Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.badResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Request was canceld ');
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: 'No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure(
            errMessage: 'UnKnown Error, Please try again later!');
      // if (dioException.message!.contains("SocketException")) {
      //   return ServerFailure(errMessage: 'No Internet Connection');
      // } else {
      //   return ServerFailure(
      //       errMessage: 'UnKnown Error, Please try again later!');
      // }
      default:
        return ServerFailure(
            errMessage: "Oops! there was an error, Please try again!  ");
    }
  }

  factory ServerFailure.badResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: "${response["error"]['message']}");
    } else if (statusCode == 404) {
      return ServerFailure(
          errMessage: "Your request not find,please try later! ");
    } else if (statusCode == 500 || statusCode == 502 || statusCode == 503) {
      return ServerFailure(errMessage: "Internal error ,please try later! ");
    } else {
      return ServerFailure(
          errMessage: "Oops! there was an error, please try again!  ");
    }
  }
}
