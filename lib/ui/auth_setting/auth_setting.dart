import 'package:flutter/material.dart';
import 'package:pocket_with_memo/services/pocket/pocket_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSettingView extends StatelessWidget {
  const AuthSettingView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Authorize Setting"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            var client = PocketClient();
            RequestToken response = await client.fetchRequestToken();
            print("code = ${response.code}");
            await client.startOauthScreen(response.code);
            AccessToken accessToken =
                await client.fetchAccessToken(response.code);
            print("accessToken = ${accessToken.accessToken}");

            final prefs = await SharedPreferences.getInstance();
            prefs.setString('pocket_access_token', accessToken.accessToken);
          },
          child: Text('authorize'),
        ),
      ),
    );
  }
}
