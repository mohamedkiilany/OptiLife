import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:optilife_app/core/services/user_plan.dart';
import '../constants/api_constants.dart';
class OptiLifeApiService {
  final Dio _dio;
  OptiLifeApiService()
    : _dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 120),
          headers: {'Content-Type': 'application/json'},
        ),
      );

  Future<UserPlan> fetchPlan(
  String prompt, {
  CancelToken? cancelToken,
}) async {
  try {
    final postRes = await _dio.post(
      '/gradio_api/call/generate_plan',
      data: {
        'data': [prompt],
      },
      cancelToken: cancelToken,
    );
    final eventId = postRes.data['event_id'];
    final getRes = await _dio.get<String>(
      '/gradio_api/call/generate_plan/$eventId',
      options: Options(responseType: ResponseType.plain),
      cancelToken: cancelToken,
    );

    final body = getRes.data ?? '';
    final dataLine = body
        .split('\n')
        .lastWhere((l) => l.startsWith('data: '), orElse: () => '');

    if (dataLine.isEmpty) {
      throw Exception('There\'s no response');
    }

    final List<dynamic> outputs = jsonDecode(dataLine.substring(6));
    final map = Map<String, dynamic>.from(outputs[0]);

    if (map['status'] == 'unsupported') {
      throw Exception(map['message'] ?? 'Unsupported request');
    }

    return UserPlan.fromJson(map);
  } on DioException catch (e) {
    throw Exception('connection error: ${e.message}');
  }
}
}
