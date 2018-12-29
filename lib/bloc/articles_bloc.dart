import 'package:bloc_provider/bloc_provider.dart';
import 'package:pocket_with_memo/services/pocket/models/item.dart';
import 'package:pocket_with_memo/services/pocket/pocket_client.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArticlesBloc implements Bloc {
  static var _items = new List<Item>();

  final _listController = BehaviorSubject<List<Item>>(seedValue: []);
  final _loadItemController = PublishSubject<int>();

  ArticlesBloc() {
    _loadItemController.stream.listen(_handleLoad);
  }

  ValueObservable<List<Item>> get list => _listController;

  Sink<void> get load => _loadItemController.sink;

  void _handleLoad(int offset) async {
    if (offset == 0) {
      _items.clear();
    }
    final prefs = await SharedPreferences.getInstance();
    var list = await PocketClient().fetchItems(prefs.getString("pocket_access_token"));
    _items.addAll(list);
    _listController.add(_items);
  }

  @override
  void dispose() async {
    await _listController.close();
    await _loadItemController.close();
  }
}
