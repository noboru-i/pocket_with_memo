import 'package:flutter/material.dart';
import 'package:pocket_with_memo/services/pocket/pocket_client.dart';

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
            print("code = " + response.code);
          },
          child: Text('authorize'),
        ),
      ),
    );
  }
}
