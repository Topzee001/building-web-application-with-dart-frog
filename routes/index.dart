// import 'package:dart_frog/dart_frog.dart';

// Response onRequest(RequestContext context) {
//   return Response(body: 'Welcome to Dart Frog!');
// }

import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:jinja/jinja.dart';
import 'package:jinja/loaders.dart';

final environment = Environment(
  loader: FileSystemLoader(paths: ['templates/']),
);

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method == HttpMethod.get) {
    final data = {
      'title': 'Dart SSR Workshop (Jinja)',
      'username': 'Topzee',
      'currentDate': DateTime.now().toIso8601String().split('T')[0],
      'showMessage': false,
    };

    try {
      final template = environment.getTemplate('home.html');
      final renderedHtml = template.render(data);

      return Response(
        body: renderedHtml,
        headers: {'Content-Type': ContentType.html.mimeType},
      );
    } catch (e, stackTrace) {
      return Response(
        statusCode: 500,
        body: 'Template error: $e\n$stackTrace',
        headers: {'Content-Type': ContentType.text.mimeType},
      );
    }
  }
  return Response(statusCode: 405);
}
