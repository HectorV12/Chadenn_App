import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

//TODO: Save products after app restart and scans again

class CodeModel extends Model {
  Future<SharedPreferences> _sPrefs = SharedPreferences.getInstance();
  Future<SharedPreferences> _sharedPrefs = SharedPreferences.getInstance();

  List<String> _listOne = [];
  List<String> _listTwo = [];
  List<String> _listStoreNames = [];
  List<String> _listGetNames = [];
  //int _counter = 0;

  List<String> get listTwo => _listTwo;
  List<String> get listGetNames => _listGetNames;
  //int get counter => _counter;

  Future<Null> addString(String barCode, String name) async {
    final SharedPreferences prefs = await _sPrefs;
    final SharedPreferences sharedPrefs = await _sharedPrefs;
    _listOne.add(barCode);
    _listStoreNames.add(name);
    prefs.setStringList('list', _listOne.reversed.toSet().toList());
    sharedPrefs.setStringList(
        'nameList', _listStoreNames.reversed.toSet().toList());
    notifyListeners();
  }

  Future<Null> getHistoryList() async {
    final SharedPreferences prefs = await _sPrefs;
    final SharedPreferences sharedPrefs = await _sharedPrefs;
    _listTwo = prefs.getStringList('list');
    _listGetNames = sharedPrefs.getStringList('nameList');
    notifyListeners();
  }
}
