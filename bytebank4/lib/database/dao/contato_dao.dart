import 'package:bytebank4/models/contato_bean.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class ContatoDao {
  static const String tableSql =
      'CREATE TABLE $_tableName($_id INTEGER PRIMARY KEY, $_name TEXT, $_accountNumber INTEGER)';
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase(tableSql);
    return db.insert(_tableName, contact.toMap());
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase(tableSql);
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    return List.generate(maps.length, (i) {
      return Contact(
        maps[i][_name],
        maps[i][_accountNumber],
        id: maps[i][_id],
      );
    });
  }
}
