import 'package:http/http.dart';

class ApiServices {
  Future<Response> getPhotoList() async {
    try {
      final url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
      final header = {"Content-Type": "application/json"};
      Response response = await get(url, headers: header);
      if (response.statusCode == 200) {
        return response;
      } else {
        // specific error message
        final errorResponse = Response(
          'Request failed with status code ${response.statusCode}',
          response.statusCode,
        );
        return errorResponse;
      }
    } catch (e) {
      // Handle other exceptions and provide an error response
      final errorResponse = Response('Error: $e', 500);
      return errorResponse;
    }
  }
}
