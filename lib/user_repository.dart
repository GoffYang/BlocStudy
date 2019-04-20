import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'common/const.dart';

class UserRepository {
  var dio=Dio();
  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
 /*   await Future.delayed(Duration(seconds: 1));
    return 'token';*/
    Response response=await dio.post(server+"/token",data: {"username":username,"password":password});
    String token=(response.data)['token'];

    return token;
  }
  Future<void> deleteToken() async{
    await Future.delayed(Duration(seconds:1));
    return;
  }

  Future<void > persistToken(String token) async{
    await Future.delayed(Duration(seconds: 1));
    return;
  }
  Future<bool> hasToken() async {
    await Future.delayed((Duration(seconds: 1)));
    return false;
  }

}
