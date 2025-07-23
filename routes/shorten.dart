import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:jinja/jinja.dart';
import 'package:jinja/loaders.dart';
import 'package:my_ssr_app/db.dart';

final environment = Environment(
  loader: FileSystemLoader(paths: ['templates']),
);

Future<Response> onRequest(RequestContext context) async {
  // get request to show the shortened URL
  if (context.request.method == HttpMethod.get) {
    final queryParams = context.request.uri.queryParameters;
    final shortenedKey = queryParams['key'];
    final originalUrl = shortenedKey != null ? shortUrls[shortenedKey] : null;
    final showError = queryParams.containsKey('error');

    final data = {
      'title': 'URL Shortner',
      'shortenedUrl': shortenedKey != null
          ? 'http://localhost:8080/go/$shortenedKey'
          : null,
      'originalUrl': originalUrl,
      'showResult': shortenedKey != null,
      'error': showError,
    };

    final template = environment.getTemplate('shorten.html');
    final renderedHtml = template.render(data);

    return Response(
      body: renderedHtml,
      headers: {'Content-Type': ContentType.html.mimeType},
    );
  }

  // handle form submission
  if (context.request.method == HttpMethod.post) {
    final formData = await context.request.formData();
    final longUrl = formData.fields['long_url'];

    if (longUrl != null && longUrl.isNotEmpty) {
//     final isValid = Uri.tryParse(longUrl)?.hasAbsolutePath ?? false;
// if(isValid){
//   return Response.redirect('/shorten?error=true');
// }
      // generate a unique short key
      final shortKey =
          longUrl.hashCode.toString().replaceAll('_', '').substring(0, 6);
      shortUrls[shortKey] = longUrl;
      print('shortened $longUrl to $shortKey');

      return Response(
        statusCode: HttpStatus.found,
        headers: {
          HttpHeaders.locationHeader: '/shorten?key=$shortKey',
        },
      );
    }

    return Response(
      statusCode: HttpStatus.found,
      headers: {
        HttpHeaders.locationHeader: '/shorten?error=true',
      },
    );
  }

  return Response(statusCode: 405);
}
