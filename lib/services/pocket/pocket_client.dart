import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pocket_with_memo/secret.dart';
import 'package:pocket_with_memo/services/pocket/models/item.dart';
import 'package:url_launcher/url_launcher.dart';

class PocketClient {
  static const apiUrl = "https://getpocket.com/v3";
  static const webAuthorizeUrl = "https://getpocket.com/auth/authorize";

  Future<RequestToken> fetchRequestToken() async {
    final http.Response response = await http.post(
      "$apiUrl/oauth/request",
      headers: {
        "X-Accept": "application/json",
      },
      body: {
        "consumer_key": Secret.pocketConsumerKey,
        "redirect_uri": "http://localhost:8080/",
      },
    );

    // TODO we need to check response is success.
    return RequestToken.fromJson(json.decode(response.body));
  }

  Future<String> startOauthScreen(String code) async {
    Stream<String> onFinish = await _server();

    String url =
        "$webAuthorizeUrl?request_token=$code&redirect_uri=http://localhost:8080/";
    launch(url);
    await onFinish.first;
    return "";
  }

  Future<AccessToken> fetchAccessToken(String code) async {
    final http.Response response = await http.post(
      "$apiUrl/oauth/authorize",
      headers: {
        "X-Accept": "application/json",
      },
      body: {
        "consumer_key": Secret.pocketConsumerKey,
        "code": code,
      },
    );

    // TODO we need to check response is success.
    return AccessToken.fromJson(json.decode(response.body));
  }

  Future<List<Item>> fetchItems(String accessToken) async {
    final http.Response response = await http.post(
      "$apiUrl/get",
      headers: {},
      body: {
        "consumer_key": Secret.pocketConsumerKey,
        "access_token": accessToken,
        "count": "10",
        "detailType": "complete",
      },
    );
    print(response.body);
    // TODO check error response
    return (json.decode(response.body)['list'] as Map)
        .values
        .map((data) => new Item.fromJson(data))
        .toList();
  }
}

Future<Stream<String>> _server() async {
  final StreamController<String> onFinish = new StreamController();
  HttpServer server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
  server.listen((HttpRequest request) async {
    request.response
      ..statusCode = 200
      ..headers.set("Content-Type", ContentType.html.mimeType)
      ..write("<html><h1>You can now close this window</h1></html>");
    await request.response.close();
    await server.close(force: true);
    onFinish.add("");
    await onFinish.close();
  });
  return onFinish.stream;
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

class AccessToken {
  const AccessToken({
    this.accessToken,
    this.userName,
  });

  final String accessToken;
  final String userName;

  factory AccessToken.fromJson(Map<String, dynamic> json) {
    return AccessToken(
      accessToken: json['access_token'],
      userName: json['username'],
    );
  }
}
