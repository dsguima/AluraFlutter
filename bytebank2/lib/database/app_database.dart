import 'package:bytebank2/models/contato_bean.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'bytebank.db'),
      onCreate: (db, version) {
  return db.execute(
  "CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, account_number INTEGER)",
  );
  },
  version: 1,
  );
  return database;
}

Future<int> save(Contact contact) async {
  final Database db = await createDatabase();
  return db.insert('contacts', contact.toMap());
}

Future<List<Contact>> findAll() async {
  final Database db = await createDatabase();
  final List<Map<String, dynamic>> maps = await db.query('contacts');
  return List.generate(maps.length, (i) {
    return Contact(
      maps[i]['name'],
      maps[i]['account_number'],
      id: maps[i]['id'],
    );
  });
}
