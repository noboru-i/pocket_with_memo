import 'package:flutter/material.dart';
import 'package:pocket_with_memo/bloc/articles_provider.dart';
import 'package:pocket_with_memo/ui/app.dart';

void main() => runApp(
      ArticlesProvider(
        child: MyApp(),
      ),
    );
