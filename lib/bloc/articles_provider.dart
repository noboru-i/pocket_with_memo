import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:pocket_with_memo/bloc/articles_bloc.dart';

class ArticlesProvider extends BlocProvider<ArticlesBloc> {
  ArticlesProvider({
    @required Widget child,
  }) : super(
          child: child,
          creator: (context, _bag) => ArticlesBloc(),
        );

  static ArticlesBloc of(BuildContext context) => BlocProvider.of(context);
}
