import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:latihan_api_demo/params/game_param.dart';
import 'package:latihan_api_demo/response/game_params_response.dart';

class GameRepository {
  final Dio _dio;

  GameRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<GameCreateResponse> addGame(GameParam gameParam) async {
    try {
      var response = await _dio.post(
        'https://voucher.crabytech.com/api/game/',
        data: gameParam.toJson(),
      );

      debugPrint('Response POST : ${response.data}');

      if (response.data != null) {
        return GameCreateResponse.fromJson(response.data);
      } else {
        throw Exception('Response body is null');
      }
    } on DioException catch (e) {
      debugPrint('DioException: ${e.message}');
      throw Exception('Failed to add game: ${e.response?.data ?? e.message}');
    } catch (e) {
      debugPrint('Unexpected error: $e');
      throw Exception('Unexpected error occurred: $e');
    }
  }
}
