import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CodeModel extends Model {
  Future<SharedPreferences> _sPrefs = SharedPreferences.getInstance();
  Future<SharedPreferences> _sharedPrefs = SharedPreferences.getInstance();
  String _code = '';
  List<String> _listOne = [];
  List<String> _listTwo = [];
  List<String> _listStoreNames = [];
  List<String> _listGetNames = [];
  //int _counter = 0;

  String get code => _code;
  List<String> get listTwo => _listTwo;
  List<String> get listGetNames => _listGetNames;
  //int get counter => _counter;

  Future<Null> addString(String barCode, String name) async {
    _code = barCode;
    final SharedPreferences prefs = await _sPrefs;
    final SharedPreferences sharedPrefs = await _sharedPrefs;
    _listOne.add(barCode);
    _listStoreNames.add(name);
    prefs.setStringList('list', _listOne);
    sharedPrefs.setStringList('nameList', _listStoreNames);
    _listTwo = prefs.getStringList('list');
    _listGetNames = sharedPrefs.getStringList('nameList');
    notifyListeners();
  }
}
