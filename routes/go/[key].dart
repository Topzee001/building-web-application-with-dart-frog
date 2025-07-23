import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:my_ssr_app/db.dart';


// final Map<String, String> shortUrls = {};

Response onRequest(RequestContext context, String key) {
  final originalUrl = shortUrls[key];

  if (originalUrl != null) {
    return Response(
      statusCode: HttpStatus.found,
      headers: {
        HttpHeaders.locationHeader: originalUrl,
      },
    );
  } else {
    return Response(statusCode: 404, body: 'Short URL not found');
  }
}
