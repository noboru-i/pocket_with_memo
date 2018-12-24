import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pocket_with_memo/secret.dart';

class PocketClient {
  static const oauthUrl = "https://getpocket.com/v3/oauth/request";

  Future<RequestToken> fetchRequestToken() async {
    final http.Response response = await http.post(
      oauthUrl,
      headers: {
        "X-Accept": "application/json",
      },
      body: {
        "consumer_key": Secret.pocketConsumerKey,
        "redirect_uri": "sample://finish_auth",
      },
    );

    // TODO we need to check response is success.
    return RequestToken.fromJson(json.decode(response.body));
  }
}

class RequestToken {
  RequestToken({
    this.code,
  });

  final String code;

  factory RequestToken.fromJson(Map<String, dynamic> json) {
    return RequestToken(
      code: json['code'],
    );
  }
}
