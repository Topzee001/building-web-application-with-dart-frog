import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  return (context) async {
    print('[${context.request.method}] ${context.request.uri.path}');
    // Pass the request to the next handler in the chain.
    final response = await handler(context);
    print('Response Status: ${response.statusCode}');
    return response;
  };
}
