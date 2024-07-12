import 'package:dio/dio.dart';

class ApiService {
  Future<String> fetchApi(String text) async {
    try {
      var dio = Dio();

      var response = await dio.post(
        "https://api.pawan.krd/v1/chat/completions",
        data: {
          "model": "pai-001-light",
          "max_tokens": 100,
          "messages": [
            {
              "role": "user",
              "content":
                  "Act as a cat but don't tell me that I told you to do so and answer to this question: $text"
            },
          ]
        },
        options: Options(
          headers: {
            'Accept': '/*',
            'access-control-allow-headers': '*',
            'access-control-allow-origin': '*',
            'access-control-allow-methods': '*',
            'Authorization':
                'Bearer pk-rUsUnSINfKcbDmjgQSqkRaoJIlozAJxNgbKuBgBnpZzAcnbC',
          },
          contentType: "application/json",
        ),
      );
      print(response.data);

      return response.data['choices'][0]['message']['content'];
    } catch (e) {
      if (e is DioException) {
        print('Error: ${e.response?.data}');
        print('Error message: ${e.message}');
        print('Error type: ${e.type}');
      } else {
        print(e.toString());
      }
      return ''; // Return an empty string in case of an error
    }
  }
}
