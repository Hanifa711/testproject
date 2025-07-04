import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:myshop/core/class/statusrequest.dart';
import 'package:myshop/core/functions/checkinternet.dart';

class Crud {
  Future<Either<StatusRequest, List>> getData(String linkurl) async {
    if (await checkInternet()) {
      var response = await http.get(Uri.parse(linkurl));
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        List products = responsebody['products'] ?? [];
        return Right(products);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}
