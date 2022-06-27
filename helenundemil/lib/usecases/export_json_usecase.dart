import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExportJsonUseCase {
  Future<void> exportJson() async {
    final list = await _getData();
    await Share.share(list);
  }

  Future<File> writeList() async {
    final list = await _getData();
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$list');
  }

  Future<String> _getData() async {
    final prefs = await SharedPreferences.getInstance();

    var savedPrefs = await _getPrefs(prefs);
    var myJson = '[{ $savedPrefs }]';

    return myJson;
  }

  Future<String> _getPrefs(SharedPreferences prefs) async {
    var savedPrefs = '';
    var keys = prefs.getKeys();
    keys.forEach((key) {
      var currentPref = prefs.get(key);
      if (currentPref != null) {
        var keyText = ' "$key": ' + currentPref.toString() + ',';
        savedPrefs += keyText;
      }
    });
    return savedPrefs;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/list.txt');
  }
}
